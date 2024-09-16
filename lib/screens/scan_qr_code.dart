import 'package:flutter/material.dart';
import 'package:kineticqr/theme/themes.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

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
          
        },
      ),
    );
  }
}
