import 'package:flutter/material.dart';
import 'package:kineticqr/screens/generate_qr_code.dart';
import 'package:kineticqr/screens/scan_qr_code.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // List of screens for navigation
  final List<Widget> _screens = [
    const GenerateQrCode(),
    const ScanQrCode(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.appBarTheme.backgroundColor, // Set background color to blue.shade800
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white, // Set selected icon and label color to white
        unselectedItemColor: Colors.white, // Set unselected icon and label color to white
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_rounded),
            label: 'Generate QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_rounded),
            label: 'Scan QR',
          ),
        ],
      ),
    );
  }
}
