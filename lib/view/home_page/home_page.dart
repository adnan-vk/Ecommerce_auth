import 'package:authentication/controller/authenticarion_provider/auth_provider.dart';
import 'package:authentication/controller/book_provider.dart';
import 'package:authentication/view/cart/cart.dart';
import 'package:authentication/view/details_page/details.dart';
import 'package:authentication/view/login_page/selectlogin.dart';
import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:authentication/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TextWidget textwidget = TextWidget();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<AuthenticationProvider>(context, listen: false);
    Provider.of<bookProvider>(context, listen: false).getBook();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor.orange,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Books List",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              pro.signOutEmail();
              pro.googleSignout();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectLoginTypePage(),
                  ));
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: "Search here ...",
              ),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Consumer<bookProvider>(
              builder: (context, value, child) => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.68,
                  ),
                  itemBuilder: (context, index) {
                    final book = value.Allbooks[index];
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail(
                              name: book.bookname.toString(),
                              authour: book.author.toString(),
                              category: book.category.toString(),
                              description: book.description.toString(),
                              price: book.price.toString(), image: book.image.toString(),
                            ),
                          )),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Placeholder(
                              fallbackHeight: size.height * 0.2,
                              child: book.image == null
                                  ? Image.network(
                                      'https://parade.com/.image/t_share/MTkwNTgxMDM0NTMyMjg0Mjg0/quotes-about-reading-books.jpg')
                                  : Image.network(book.image.toString()),
                            ),
                            const SizedBox(height: 10),
                            textwidget.text(
                                data: book.bookname,
                                color: appcolor.black,
                                weight: FontWeight.bold,
                                size: 16.0),
                            textwidget.text(
                                data: book.author,
                                color: appcolor.grey,
                                size: 12.0),
                            textwidget.text(
                                data: book.category,
                                color: appcolor.grey[600],
                                size: 12.0),
                            textwidget.text(
                                data: "₹ ${book.price}",
                                color: appcolor.orange,
                                weight: FontWeight.bold,
                                size: 14.0),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: value.Allbooks.length),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartPage()));
        },
        label: const Text('Go to Cart'),
        icon: const Icon(Icons.shopping_cart),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
