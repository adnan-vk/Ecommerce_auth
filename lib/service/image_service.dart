// import 'dart:developer';
// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageService {
//   String? downloadUrl;
//   FirebaseStorage storage = FirebaseStorage.instance;
//   ImagePicker imagePicker = ImagePicker();
//   addImage(imageName) async {
//     try {
//       final XFile? pickedFile =
//           await imagePicker.pickImage(source: ImageSource.gallery);

//       if (pickedFile != null) {
//         File imageFile = File(pickedFile.path);
//         Reference imageFolder = storage.ref().child('image');
//         Reference uploadImage = imageFolder.child("$imageName.jpg");
//         await uploadImage.putFile(imageFile);
//         downloadUrl = await uploadImage.getDownloadURL();
//         // notifyListeners();
//       }
//     } catch (error) {
//       log('Error: $error');
//       return Exception('Image cannot be added: $error');
//     }
//     // notifyListeners();
//   }
// }
