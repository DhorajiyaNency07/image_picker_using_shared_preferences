import 'package:flutter/material.dart';
import 'screens/image_save_delete_shared_pref.dart';
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
      home: const ImageGrid(),  // only image picker save and delete using shared preference and gridview
      // home: const LoginScreen(),   // try to using login signup on shared preference and then image picker
    );
  }
}
