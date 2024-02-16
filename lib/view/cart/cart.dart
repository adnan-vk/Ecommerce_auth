import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> _cartItems = [
    {'title': 'Book 1', 'author': 'Author A', 'price': 20},
    {'title': 'Book 2', 'author': 'Author B', 'price': 25},
    {'title': 'Book 3', 'author': 'Author C', 'price': 30},
    {'title': 'Book 4', 'author': 'Author D', 'price': 35},
    {'title': 'Book 5', 'author': 'Author E', 'price': 40},
  ];

  double _totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    setState(() {
      _totalPrice = _cartItems.fold(0, (total, item) => total + item['price']);
    });
  }

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
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_cartItems[index]['title']),
                    subtitle: Text(_cartItems[index]['author']),
                    trailing: Text('₹ ${_cartItems[index]['price']}'),
                  );
                },
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Text(
              'Total: ₹ $_totalPrice',
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
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
