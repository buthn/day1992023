

class Product {
  String? productName;
  String? Category;
  double? price;

  Product({this.productName, this.Category, this.price});

  Map<String,dynamic> toMap(){
    return{
      "productName":productName,
      "Category":Category,
      "price":price,
    };
  }
}