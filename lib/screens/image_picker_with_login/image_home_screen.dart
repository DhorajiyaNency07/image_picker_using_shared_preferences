import 'package:flutter/material.dart';

class ImageHomeScreen extends StatefulWidget {
  const ImageHomeScreen({Key? key}) : super(key: key);

  @override
  State<ImageHomeScreen> createState() => _ImageHomeScreenState();
}

class _ImageHomeScreenState extends State<ImageHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Home Screen"),
      ),
      body: const Center(
        child: Text("you are login successfully..."),
      ),
    );
  }
}
