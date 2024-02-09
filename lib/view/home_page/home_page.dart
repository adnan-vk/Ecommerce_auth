import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:authentication/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Books List",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 40,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const Favourite(),
              //   ),
              // );
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: "Search here ...",
              ),
              onChanged: (value) {
                // Perform search operation here
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: size.height * .4,
                crossAxisSpacing: size.width * 0.01,
                mainAxisSpacing: size.height * 0.01,
              ),
              itemBuilder: (context, index) {
                // Replace this with your book item data
                // final item = books[index];

                // Temporary book data for demonstration
                // final item = Book(
                //   title: 'Book Title $index',
                //   author: 'Author Name $index',
                //   category: 'Category $index',
                //   price: '\$$index',
                //   image: 'https://via.placeholder.com/150',
                //   description: 'Book description $index',
                // );

                return GestureDetector(
                  // onTap: () => Navigator.push(
                  //   context
                  //   // MaterialPageRoute(
                  //   //   builder: (context) => DetailsPage(
                  //   //     title: item.title,
                  //   //     image: item.image,
                  //   //     description: item.description,
                  //   //     price: item.price,
                  //   //     author: item.author,
                  //   //   ),
                  //   // ),
                  // ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            // Container(
                            //   width: size.width * 0.5,
                            //   height: size.height * 0.3,
                            //   decoration: BoxDecoration(
                            //     image: DecorationImage(
                            //       fit: BoxFit.fill,
                            //       image: NetworkImage(item.image),
                            //     ),
                            //   ),
                            // ),
                            Positioned(
                              left: 180,
                              top: 20,
                              child: Container(
                                color: Colors.white,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextWidget().text(
                          data: "name : ",
                          // ${item.title}".toUpperCase(),
                          color: appcolor.orange,
                          weight: FontWeight.w900,
                          size: 15.0,
                        ),
                        TextWidget().text(
                          data: "author : ",
                          // ${item.author}".toUpperCase(),
                          color: appcolor.orange,
                          size: 10.0,
                          weight: FontWeight.w200,
                        ),
                        TextWidget().text(
                          data: "Type :",  
                          // ${item.category}".toUpperCase(),
                          color: appcolor.orange,
                          weight: FontWeight.w200,
                          size: 10.0,
                        ),
                        TextWidget().text(
                          data: "₹ : ",
                          // ${item.price}".toUpperCase(),
                          color: appcolor.orange,
                          size: 10.0,
                          weight: FontWeight.w200,
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}