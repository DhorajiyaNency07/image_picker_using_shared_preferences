import 'package:flutter/material.dart';
import 'screens/image_grid_screen.dart';
import 'screens/image_picker_with_login/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ImageGrid(),
      home: const LoginScreen(),
    );
  }
}
