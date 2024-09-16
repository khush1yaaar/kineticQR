import 'package:flutter/material.dart';
import 'package:kineticqr/theme/themes.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQrCode> {
  @override
  Widget build(BuildContext context) {
    // Fetch the current theme data to apply to the AppBar dynamically.
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Generate QR Code', 
          style: TextStyle(color: Colors.white),
        ),
        // Use the AppBar color from the current theme.
        backgroundColor: theme.appBarTheme.backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              // Toggling the theme when the button is pressed.
              currentTheme.toggleTheme();
            },
            // Conditionally setting the icon based on the current theme.
            icon: CustomTheme.isDarkTheme 
              ? const Icon(Icons.sunny, color: Colors.white,) // Icon for light theme.
              : const Icon(Icons.brightness_3_rounded, color: Colors.white,), // Icon for dark theme.
          )
        ],
      ),
      body: Center(
        child: Text(
          'QR Code Generator',
          style: theme.textTheme.headlineMedium, // Example of using text style from theme.
        ),
      ),
    );
  }
}
