import 'package:flutter/material.dart';
import 'package:kineticqr/screens/home_screen.dart';
import 'package:kineticqr/theme/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Listening to the theme changes
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {}); // Rebuild the app when the theme changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KineticQR',
      debugShowCheckedModeBanner: false,
      themeMode: currentTheme.currentTheme, // Set the theme mode (light/dark)
      theme: CustomTheme.lightTheme, // Define light theme
      darkTheme: CustomTheme.darkTheme, // Define dark theme
      home: const HomeScreen(), // The main home screen of the app
    );
  }
}
