import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:authentication/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String name;
  final String authour;
  final String category;
  final String description;
  final String price;
  final String image;

  const Detail({
    super.key,
    required this.name,
    required this.authour,
    required this.category,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor.orange,
        title: const Text('Book Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://images.theconversation.com/files/45159/original/rptgtpxd-1396254731.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=754&fit=clip',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            TextWidget().text(
                data: "Book Name : $name",
                size: 24.0,
                weight: FontWeight.bold,
                color: appcolor.orange),
            const SizedBox(height: 10),
            TextWidget().text(
                data: "Category: $category",
                size: 18.0,
                style: FontStyle.italic),
            const SizedBox(height: 10),
            TextWidget().text(
                data: "Author Name: $authour",
                size: 18.0,
                style: FontStyle.italic),
            const SizedBox(height: 10),
            TextWidget().text(
                data: "Description: $description",
                size: 18.0,
                style: FontStyle.italic),
            const SizedBox(height: 10),
            TextWidget().text(
                data: "Price: $price",
                size: 18.0,
                weight: FontWeight.bold,
                color: appcolor.orange),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(appcolor.grey)),
              onPressed: () {},
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextWidget().text(
                      data: 'BUY NOW', size: 18.0, style: FontStyle.italic)),
            ),
          ],
        ),
      ),
    );
  }
}
