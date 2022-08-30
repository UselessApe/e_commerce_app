class ProductModel {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String? id;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.id,
  });

  Map<String, dynamic> toMap(String id) {
    return {
      "name": name,
      "description": description,
      "price": price,
      "imageUrl": imageUrl,
      "id": id,
    };
  }

  ProductModel.fromMap(Map<String, dynamic> map)
      : name = map["name"] ?? "",
        description = map["description"] ?? "",
        price = map["price"] ?? 0.0,
        imageUrl = map["imageUrl"] ?? "",
        id = map["id"] ?? "";
}
