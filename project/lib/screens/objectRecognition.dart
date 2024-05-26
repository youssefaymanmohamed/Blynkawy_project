import 'dart:io'; // Import the dart:io package

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model.dart'; // Import your model.dart file

class DetectionPage extends StatefulWidget {
  const DetectionPage({Key? key}) : super(key: key); // Add a named 'key' parameter to the constructor

  @override
  _DetectionPageState createState() => _DetectionPageState();
}

class _DetectionPageState extends State<DetectionPage> {
  XFile? _image; // Change PickedFile to XFile
  List? _prediction;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery); // Replace the deprecated 'getImage' method with 'pickImage'

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile; // No need to cast here
      });

      predictImage();
    }
  }

  Future<void> takePhoto() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera); // Replace the deprecated 'getImage' method with 'pickImage'

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile; // No need to cast here
      });

      predictImage();
    }
  }

  Future<void> predictImage() async {
    if (_image != null) {
      final prediction = await AppTfliteModel.objectdetectionStream(ImageSource.gallery);
      setState(() {
        _prediction = prediction;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Detection'), // Add the 'const' keyword to the constructor invocation
        backgroundColor: Color(0xffFFF5E0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff141E46),
              minimumSize: Size(200, 50), // Set the minimumSize property to specify the button size
              ),
              onPressed: pickImage,
              child: const Text('Pick Image', style: TextStyle(color: Colors.white)), // Add the 'const' keyword to the constructor invocation
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff141E46),
              minimumSize: Size(200, 50), // Set the minimumSize property to specify the button size
              ),
              onPressed: takePhoto,
              child: const Text('Take Photo', style: TextStyle(color: Colors.white)), // Add the 'const' keyword to the constructor invocation

            ),
            if (_image != null)
              Image.file(
              File(_image!.path),
              height: 300,
              width: 300,
              ),
            if (_prediction != null)
              Text('Prediction: ${_prediction.toString()}'),
            
            ],
        ),
      ),
      backgroundColor: Color(0xffFFF5E0),
    );
  }
}