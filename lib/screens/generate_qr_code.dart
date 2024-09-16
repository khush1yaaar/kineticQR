import 'package:flutter/material.dart';
import 'package:kineticqr/screens/scan_qr_code.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => ScanQrCode())
              );
            }, 
            icon: const Icon(Icons.qr_code)
          )
        ],
      ),
    );
  }
}