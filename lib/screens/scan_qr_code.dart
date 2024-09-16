import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:kineticqr/theme/themes.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  // Function to check the safety of a URL using the Google Safe Browsing API
  Future<bool> _checkUrlSafety(String url) async {
    // Replace with actual URL reputation service API call
    const apiKey = 'AIzaSyDle-UK9QrU3AkeZfdVej_5D7CPObxDwuw';
    final response = await http.post(
      Uri.parse('https://safebrowsing.googleapis.com/v4/threatMatches:find?key=$apiKey'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'client': {
          'clientId': 'your-app-id',
          'clientVersion': '1.0.0',
        },
        'threatInfo': {
          'threatTypes': ['MALWARE', 'SOCIAL_ENGINEERING'],
          'platformTypes': ['ANY_PLATFORM'],
          'threatEntryTypes': ['URL'],
          'threatEntries': [
            {'url': url},
          ],
        },
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // If the 'matches' field is null or empty, the URL is considered safe
      return data['matches'] == null || data['matches'].isEmpty;
    } else {
      // Print error message if the API call fails
      print('Failed to check URL safety');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scan QR Code',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              // Toggling the theme when the button is pressed
              currentTheme.toggleTheme();
            },
            icon: CustomTheme.isDarkTheme
                ? const Icon(
                    Icons.sunny,
                    color: Colors.white,
                  ) // Icon for light theme
                : const Icon(
                    Icons.brightness_3_rounded,
                    color: Colors.white,
                  ), // Icon for dark theme
          )
        ],
      ),
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          returnImage: true,
        ),
        onDetect: (capture) async {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            final String? rawValue = barcode.rawValue;
            print('Found a Barcode!! $rawValue');
          }

          if (image != null) {
            final String? rawValue = barcodes.first.rawValue;
            final Uri? url = rawValue != null ? Uri.tryParse(rawValue) : null;
            if (url != null && url.hasAbsolutePath) {
              final isSafe = await _checkUrlSafety(url.toString());
              showDialog(
                context: context,
                builder: (context) {
                  if (isSafe) {
                    return AlertDialog(
                      title: GestureDetector(
                        onTap: () {
                          _launchUrl(url);
                        },
                        child: Text(url.toString()),
                      ),
                      content: Image(image: MemoryImage(image)),
                    );
                  } else {
                    return AlertDialog(
                      title: const Text(
                        'Warning: Potentially Harmful Website',
                        style: TextStyle(color: Colors.red),
                      ),
                      content: Text(
                        'The $url URL might be harmful. Proceed with caution.',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            _launchUrl(url);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Proceed'),
                        ),
                      ],
                    );
                  }
                },
              );
            }
          }
        },
      ),
    );
  }

  // Function to launch a URL in the default web browser
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
