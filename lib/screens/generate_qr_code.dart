import 'package:flutter/material.dart';
import 'package:kineticqr/screens/generated_qr.dart';
import 'package:kineticqr/theme/themes.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQrCode> {
  final TextEditingController _controller = TextEditingController();
  String? qrData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Generate QR Code',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              currentTheme.toggleTheme();
            },
            icon: CustomTheme.isDarkTheme
                ? const Icon(
                    Icons.sunny,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.brightness_3_rounded,
                    color: Colors.white,
                  ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Adding a form-like structure for better input control
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter data for QR Code',
                hintText: 'Type something...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.qr_code),
                // Customizing the focused border
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: theme.appBarTheme.backgroundColor ??
                        Colors.blue.shade800,
                    width: 2.0,
                  ),
                ),
                // Customizing the label and hint text colors
                labelStyle: TextStyle(
                  color:
                      theme.appBarTheme.backgroundColor ?? Colors.blue.shade800,
                ),
                hintStyle: TextStyle(
                  color: theme.appBarTheme.backgroundColor?.withOpacity(0.6) ??
                      Colors.blue.shade800.withOpacity(0.6),
                ),
              ),
              cursorColor:
                  theme.appBarTheme.backgroundColor ?? Colors.blue.shade800,
              style: TextStyle(
                color:
                    theme.appBarTheme.backgroundColor ?? Colors.blue.shade800,
              ),
            ),

            const SizedBox(height: 20),
            // Adding a button to submit the data
            ElevatedButton(
              onPressed: () {
                setState(() {
                  qrData = _controller.text;
                  if (qrData != null && qrData!.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GeneratedQR(qrData: qrData),
                      ),
                    );
                  } else {
                    // You could add a snackbar or dialog here for feedback
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter some data'),
                      ),
                    );
                  }
                });
              },
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(theme.appBarTheme.backgroundColor),
              ),
              child: const Text(
                'Generate QR Code',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
