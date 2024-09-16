import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:kineticqr/theme/themes.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
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
              // Toggling the theme when the button is pressed.
              currentTheme.toggleTheme();
            },
            // Conditionally setting the icon based on the current theme.
            icon: CustomTheme.isDarkTheme
                ? const Icon(
                    Icons.sunny,
                    color: Colors.white,
                  ) // Icon for light theme.
                : const Icon(
                    Icons.brightness_3_rounded,
                    color: Colors.white,
                  ), // Icon for dark theme.
          )
        ],
      ),
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          returnImage: true,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            final String? rawValue = barcode.rawValue;
            print('Found a Barcode!! $rawValue');
          }
          if (image != null) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: GestureDetector(
                    onTap: () {
                      final String? rawValue = barcodes.first.rawValue;
                      final Uri? url = rawValue != null ? Uri.tryParse(rawValue) : null;
                      if (url != null && url.hasAbsolutePath) {
                        _launchUrl(url);
                      } else {
                        // Handle non-URL barcodes here if needed.
                        print('Found a Barcode!! ${barcodes.first.rawValue}');
                      }
                    },
                    child: Text('${barcodes.first.rawValue} click to open in browser'),
                  ),
                  content: GestureDetector(
                    onTap: () {
                      final String? rawValue = barcodes.first.rawValue;
                      final Uri? url = rawValue != null ? Uri.tryParse(rawValue) : null;
                      if (url != null && url.hasAbsolutePath) {
                        _launchUrl(url);
                      } else {
                        // Handle non-URL barcodes here if needed.
                        print('Found a Barcode!! ${barcodes.first.rawValue}');
                      }
                    },
                    child: Image(image: MemoryImage(image))
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
