import 'package:flutter/material.dart';
import 'package:kineticqr/screens/generate_qr_code.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => GenerateQrCode())
              );
              },
              icon: const Icon(Icons.qr_code))
        ],
      ),
    );
  }
}
