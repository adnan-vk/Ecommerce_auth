import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImgService {
  final ImagePicker imagePicker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String?> uploadImage(File imageFile, String imageName) async {
    try {
      Reference imageFolder = storage.ref().child('image');
      Reference uploadImage = imageFolder.child("$imageName.jpg");
      await uploadImage.putFile(imageFile);
      return await uploadImage.getDownloadURL();
    } catch (error) {
      log('Error uploading image: $error');
      return null;
    }
  }

  Future<File?> pickImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
