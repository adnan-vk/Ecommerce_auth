import 'package:authentication/controller/book_provider.dart';
import 'package:authentication/controller/wishlist_provider.dart';
import 'package:authentication/view/details_page/details.dart';
import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:authentication/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TextWidget textwidget = TextWidget();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookpro = Provider.of<bookProvider>(context, listen: false);
    bookpro.getBook();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Books Store",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for books...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
              ),
              onChanged: (value) {
                bookpro.search(value);
              },
            ),
          ),
        ),
      ),
      body: Consumer<bookProvider>(
        builder: (context, value, child) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.55,
          ),
          itemBuilder: (context, index) {
            final book = value.searchlist.isNotEmpty
                ? value.searchlist[index]
                : value.allbooks[index];
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail(
                      name: book.bookname.toString(),
                      author: book.author.toString(),
                      category: book.category.toString(),
                      description: book.description.toString(),
                      price: book.price.toString(),
                      image: book.image.toString(),
                    ),
                  )),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget().text(
                          data: book.bookname,
                          size: 16.0,
                          weight: FontWeight.bold),
                      const SizedBox(height: 8),
                      TextWidget().text(
                          data: "₹ ${book.price}.00",
                          size: 14.0,
                          color: appcolor.green,
                          weight: FontWeight.bold),
                      const SizedBox(height: 8),
                      Image.network(
                        '${book.image}',
                        height: size.height * .18,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Consumer<WishlistProvider>(
                              builder: (context, value, child) => IconButton(
                                  onPressed: () {
                                    final wish = value.wishlistCheck(book);
                                    value.wishlistCliscked(book.id!, wish);
                                  },
                                  icon: value.wishlistCheck(book)
                                      ? Icon(
                                          Icons.favorite_border_outlined,
                                          color: appcolor.red,
                                        )
                                      : Icon(
                                          Icons.favorite,
                                          color: appcolor.red,
                                        ))),
                          TextWidget().text(
                              data: "₹ ${book.price}.00",
                              size: 14.0,
                              color: appcolor.green,
                              weight: FontWeight.bold),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: value.searchlist.isNotEmpty
              ? value.searchlist.length
              : value.allbooks.length,
        ),
      ),
    );
  }
}
