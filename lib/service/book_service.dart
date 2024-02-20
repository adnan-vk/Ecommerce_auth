// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:authentication/model/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BookService {
  String Book = 'book';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<Bookmodel> book;
  Reference storage = FirebaseStorage.instance.ref();

  BookService() {
    book = firestore.collection(Book).withConverter<Bookmodel>(
      fromFirestore: (snapshot, options) {
        return Bookmodel.fromjson(snapshot.id, snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.tojson();
      },
    );
  }

  Future<void> addProduct(Bookmodel data) async {
    try {
      await book.add(data);
    } catch (e) {
      log('Error adding post :$e');
    }
  }

  Future<List<Bookmodel>> getAllBooks() async {
    final snapshot = await book.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
