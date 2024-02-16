import 'dart:developer';
import 'dart:io';
import 'package:authentication/service/book_service.dart';
import 'package:authentication/service/image_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImgProvider extends ChangeNotifier {
  final picker = ImagePicker();
  File? pickedImage;
  bookService bookservice = bookService();
  String imageName = DateTime.now().microsecondsSinceEpoch.toString();
  String? downloadUrl;
  File? file;
  ImagePicker imagePicker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;
  // ImageService imageservice = ImageService();

  Future addImage(ImageSource source) async {
    // await imageservice.addImage(imageName);
    // notifyListeners();
    try {
      final XFile? pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        Reference imageFolder = storage.ref().child('image');
        Reference uploadImage = imageFolder.child("$imageName.jpg");
        await uploadImage.putFile(imageFile);
        downloadUrl = await uploadImage.getDownloadURL();
        notifyListeners();
      }
    } catch (error) {
      log('Error: $error');
      return Exception('Image cannot be added: $error');
    }
    notifyListeners();
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      log("image picked");
      notifyListeners();
    }
  }
}
