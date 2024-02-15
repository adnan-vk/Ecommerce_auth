import 'package:authentication/model/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class bookService {
  String Book = 'book';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<bookmodel> book;

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
      print('Error adding post :$e');
    }
  }

  Future<List<bookmodel>> getAllProducts() async {
    final snapshot = await book.orderBy('timeStamp', descending: true).get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
