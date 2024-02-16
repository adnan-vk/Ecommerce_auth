// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:authentication/model/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class bookService {
  String Book = 'book';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<bookmodel> book;
  Reference storage = FirebaseStorage.instance.ref();

  bookService() {
    book = firestore.collection(Book).withConverter<bookmodel>(
      fromFirestore: (snapshot, options) {
        return bookmodel.fromjson(snapshot.id, snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.tojson();
      },
    );
  }

  Future<void> addProduct(bookmodel data) async {
    try {
      await book.add(data);
    } catch (e) {
      log('Error adding post :$e');
    }
  }

  Future<List<bookmodel>> getAllBooks() async {
    final snapshot = await book.orderBy('timeStamp', descending: true).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  // Future<String> uploadImage(imageUrl, imagePath) async {
  //   Reference imageFolder = storage.child('productImage');
  //   Reference? uploadImage = imageFolder.child('$imageUrl.jpg');

  //   await uploadImage.putFile(imagePath);
  //   String downloadURL = await uploadImage.getDownloadURL();
  //   log(downloadURL);
  //   return downloadURL;
  // }
}
