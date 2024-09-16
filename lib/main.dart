import 'package:flutter/material.dart';
import 'package:kineticqr/screens/generate_qr_code.dart';
import 'package:kineticqr/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.black54, primarySwatch: Colors.brown),
      home: const GenerateQrCode()
    );
  }
}
