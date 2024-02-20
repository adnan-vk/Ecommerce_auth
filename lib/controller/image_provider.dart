import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImgProvider extends ChangeNotifier {
  final ImagePicker imagePicker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;

  File? pickedImage;
  String imageName = DateTime.now().microsecondsSinceEpoch.toString();
  String? downloadUrl;

  Future<void> addImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await imagePicker.pickImage(source: source);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        Reference imageFolder = storage.ref().child('image');
        Reference uploadImage = imageFolder.child("$imageName.jpg");
        await uploadImage.putFile(imageFile);

        try {
          downloadUrl = await uploadImage.getDownloadURL();
          log('Download URL: $downloadUrl');
          notifyListeners();
        } catch (error) {
          log('Error getting download URL: $error');
        }
      }
    } catch (error) {
      log('Error: $error');
      log('Error adding image: $error');
    }
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      log("Image picked");
      notifyListeners();
    }
  }
}
