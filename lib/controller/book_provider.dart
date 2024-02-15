// ignore_for_file: camel_case_types

import 'package:authentication/model/book_model.dart';
import 'package:authentication/service/book_service.dart';
import 'package:flutter/foundation.dart';

class bookProvider extends ChangeNotifier {
  bookService bookservice = bookService();

  addBook(bookmodel data) async {
    await bookservice.addProduct(data);
  }
}
