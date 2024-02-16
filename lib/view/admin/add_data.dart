// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison

import 'dart:developer';

import 'package:authentication/controller/book_provider.dart';
import 'package:authentication/controller/image_provider.dart';
import 'package:authentication/model/book_model.dart';
import 'package:authentication/widgets/text_filed_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categorycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    pickImage(context);
                  },
                  child: Consumer<ImgProvider>(
                    builder: (context, value, child) => CircleAvatar(
                      backgroundImage: value.pickedImage != null
                          ? FileImage(value.pickedImage!)
                          : null,
                      radius: 70,
                      child: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              textFormField().textformfield(
                  controller: nameController, labeltext: "Book Name"),
              const SizedBox(height: 20),
              textFormField().textformfield(
                  controller: authorController, labeltext: "Author"),
              const SizedBox(height: 20),
              textFormField().textformfield(
                  controller: categorycontroller, labeltext: "Category"),
              const SizedBox(height: 20),
              textFormField().textformfield(
                  controller: descriptionController, labeltext: "Description"),
              const SizedBox(height: 20),
              textFormField().textformfield(
                  controller: priceController, labeltext: "Price"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  addData();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addData() {
    final pro = Provider.of<bookProvider>(context, listen: false);
    final name = nameController.text.trim();
    final authour = authorController.text.trim();
    final description = descriptionController.text.trim();
    final price = int.parse(priceController.text.trim());
    final category = categorycontroller.text.trim();

    if (name.isEmpty ||
        authour.isEmpty ||
        description.isEmpty ||
        price == null) {
      log('invalid input');
      return;
    }
    final data = bookmodel(
      category: category,
      author: authour,
      bookname: name,
      description: description,
      price: price,
    );
    // log('data added');
    pro.addBook(data);
  }

  Future<dynamic> pickImage(BuildContext context) {
    final pro = Provider.of<ImgProvider>(context, listen: false);
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("Select Image Source"),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                pro.getImage(ImageSource.camera);
              },
              child: const Text("Camera"),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                pro.getImage(ImageSource.gallery);
              },
              child: const Text("Gallery"),
            ),
          ],
        );
      },
    );
  }
}
