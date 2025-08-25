import 'package:flutter/material.dart';
import 'package:my_app/screens/adventure_screens.dart' show SplashScreen;
// Import your new screen file

void main() {
  runApp(const AdVentureApp());
}

class AdVentureApp extends StatelessWidget {
  const AdVentureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AD-venture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Lao Sans Pro',
      ),
      home: const SplashScreen(), // This will come from adventure_screens.dart
      debugShowCheckedModeBanner: false,
    );
  }
}
