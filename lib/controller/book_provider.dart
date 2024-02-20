// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:authentication/model/book_model.dart';
import 'package:authentication/service/book_service.dart';
import 'package:flutter/foundation.dart';

class bookProvider extends ChangeNotifier {
  List<Bookmodel> filtered = [];
  // String search = '';
  List<Bookmodel> searchlist = [];
  BookService bookservice = BookService();
  List<Bookmodel> Allbooks = [];

  addBook(Bookmodel data) async {
    await bookservice.addProduct(data);
  }

  getBook() async {
    Allbooks = await bookservice.getAllBooks();
    notifyListeners();
  }

  void search(String value) {
    searchlist = Allbooks.where((element) =>
        element.bookname!.toLowerCase().contains(value.toLowerCase())).toList();
    notifyListeners();
  }
}
