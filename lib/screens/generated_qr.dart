import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class GeneratedQR extends StatefulWidget {
  final String? qrData;
  GeneratedQR({super.key, required this.qrData});

  @override
  State<GeneratedQR> createState() => _GeneratedQRState();
}

class _GeneratedQRState extends State<GeneratedQR> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated QR Code', style: TextStyle(color: Colors.white)),
        backgroundColor: theme.appBarTheme.backgroundColor,
      ),
      body: Container(
        color: theme.scaffoldBackgroundColor, // Match the scaffold background color
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: theme.cardColor, // Background color for QR code
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: theme.shadowColor.withOpacity(0.3), // Shadow color
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                // ignore: deprecated_member_use
                child: PrettyQrView.data(
                  data: widget.qrData!,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
