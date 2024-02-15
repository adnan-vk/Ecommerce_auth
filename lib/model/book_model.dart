class bookmodel {
  String? bookname;
  String? author;
  String? description;
  int? price;
  String? image;
  bookmodel(
      {this.bookname, this.author, this.description, this.price, this.image});

  factory bookmodel.fromjson(String id, Map<String, dynamic> json) {
    return bookmodel(
        author: json['authour'],
        bookname: json['name'],
        description: json['description'],
        price: json['price'],
        image: json['image']);
  }

  Map<String,dynamic>tojson(){
    return{
      'authour' : author,
      'name' : bookname,
      'description' : description,
      'price' : price,
      'image' : image
    };
  }
}
