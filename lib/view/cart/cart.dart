import 'package:authentication/view/home_page/home_page.dart';
import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.orange.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Book Title ${index + 1}'),
                    subtitle: const Text('Author Name'),
                    trailing: const Text('₹ 20'),
                  );
                },
              ),
            ),
            Divider(
              thickness: 1,
              color: appcolor.black,
            ),
            textwidget.text(
                data: "Total: ₹ 100",
                color: appcolor.orange,
                weight: FontWeight.bold,
                size: 20.0),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
