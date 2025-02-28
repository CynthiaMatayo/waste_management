import 'package:flutter/material.dart';
import 'package:waste_management/authentication/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.blueAccent,
    colorScheme: ColorScheme(
      background: Colors.greenAccent,
      brightness: Brightness.light,
      primary: Colors.blue,
      onPrimary: Colors.white30,
      secondary: Colors.greenAccent,
      onSecondary: Colors.white10,
      error: Colors.red,
      onError: Colors.black,
      surface: Colors.yellow,
      onSurface: const Color.fromARGB(255, 0, 0, 0),
    ),
  );
  final light = ThemeData.light().copyWith(
    colorScheme: ColorScheme(
      background: Colors.greenAccent,
      brightness: Brightness.light,
      primary: Colors.blue,
      onPrimary: Colors.white30,
      secondary: Colors.greenAccent,
      onSecondary: Colors.white10,
      error: Colors.red,
      onError: Colors.black,
      surface: Colors.yellow,
      onSurface: const Color.fromARGB(255, 0, 0, 0),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: dark,
      home: LoginPage(),
    );
  }
}
