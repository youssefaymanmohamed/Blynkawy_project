import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class AppTfliteModel {
  static bool _isObjectDetectionModelLoaded = false;
  static int _lastProcessedTime = DateTime.now().millisecondsSinceEpoch;

  static bool get getIsObjectDetectionModelLoaded => _isObjectDetectionModelLoaded;

  static Future<void> loadObjectDetectionModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/models/ssd_mobilenet.tflite",
        labels: "assets/models/labels.txt",
      );
      _isObjectDetectionModelLoaded = true;
      log("Model loaded successfully");
    } catch (e) {
      log("Failed to load model: $e");
    }
  }

  static Future<List?> objectdetectionStream(ImageSource source) async {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - _lastProcessedTime < 1000) {
      return null;
    }
    _lastProcessedTime = currentTime;
    try {
      // Check if the model is loaded. If not, load it.
      if (!_isObjectDetectionModelLoaded) {
        await loadObjectDetectionModel();
      }
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile == null) return null;
      var image = File(pickedFile.path);
      var result = await Tflite.detectObjectOnImage(
        path: image.path,
        model: "ssd_mobilenet",
        imageMean: 127.5,
        imageStd: 127.5,
        numResultsPerClass: 1,
        threshold: 0.4,
      );
      log("Model inference ran successfully");
      return result;
    } catch (e) {
      log("Failed to run model inference: $e");
      return null;
    }
  }

  static Future<void> closeModel() async {
    await Tflite.close();
    _isObjectDetectionModelLoaded = false;
  }
}