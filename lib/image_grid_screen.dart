import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

//
class ImageGrid extends StatefulWidget {
  const ImageGrid({super.key});

  @override
  _ImageGridState createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  List<String> _imagePath = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Grid'),
      ),
      body: GridView.builder(
        itemCount: _imagePath.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.greenAccent,
                child: Image.asset(
                  _imagePath[index],
                  fit: BoxFit.cover,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: Container(
              //     height: 90,
              //     width: 90,
              //     color: Colors.red,
              //     child: Image.network(
              //       _imagePath[index],
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteImage(index),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _loadImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> imageList = prefs.getStringList('imageList') ?? [];
    setState(() {
      _imagePath = imageList;
    });
  }

  void _saveImages(List<String> imageList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('imageList', imageList);
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) {
      return;
    }
    setState(() {
      _imagePath.add(image.path);
    });
    _saveImages(_imagePath);
  }

  void _deleteImage(int index) {
    setState(() {
      _imagePath.removeAt(index);
    });
    _saveImages(_imagePath);
  }
}
