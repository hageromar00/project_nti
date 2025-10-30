class ProductModel {
  final String name;
  final double price;
  final String image;
  final String description;
  final String category;

  ProductModel({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
  });


  //toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'category': category,
    };
  }

  //fromJson (convert json to object)  (constructor)
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: double.parse(json['price'].toString()),
      image: json['image'],
      description: json['description'],
      category: json['category'],
    );
  }
}
