// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:authentication/model/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BookService {
  String Book = 'book';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<Bookmodel> book;
  Reference storage = FirebaseStorage.instance.ref();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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

  Future<void> wishlistClicked(String id, bool status) async {
    try {
      if (status == true) {
        await book.doc(id).update({
          'wishlist': FieldValue.arrayUnion([
            firebaseAuth.currentUser!.email ??
                firebaseAuth.currentUser!.phoneNumber
          ])
        });
      } else {
        await book.doc(id).update({
          'wishlist': FieldValue.arrayRemove([
            firebaseAuth.currentUser!.email ??
                firebaseAuth.currentUser!.phoneNumber
          ])
        });
      }
    } catch (e) {
      log("error is $e");
    }
  }
}
