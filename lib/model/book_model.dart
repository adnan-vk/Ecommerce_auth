class Bookmodel {
  String? bookname;
  String? author;
  String? description;
  int? price;
  String? category;
  String? image;
  Bookmodel(
      {required this.bookname,
      required this.author,
      required this.description,
      required this.price,
      this.image,
      required this.category});

  factory Bookmodel.fromjson(String id, Map<String, dynamic> json) {
    return Bookmodel(
        author: json['authour'],
        bookname: json['name'],
        description: json['description'],
        category: json['category'],
        price: json['price'],
        image: json['image']);
  }

  Map<String, dynamic> tojson() {
    return {
      'authour': author,
      'name': bookname,
      'description': description,
      "category": category,
      'price': price,
      'image': image
    };
  }
}
