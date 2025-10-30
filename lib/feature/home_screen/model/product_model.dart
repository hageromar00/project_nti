class ProductModel {
  String? id;
  final String name;
  final double price;
  final String image;
  final String description;
  final String category;

  ProductModel({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id, // مهم
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'category': category,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
      category: json['category'],
    );
  }
}
