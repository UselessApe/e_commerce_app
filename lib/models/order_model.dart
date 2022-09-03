import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/product_model.dart';

class Order {
  String confirmationId;
  Timestamp timestamp;

  List<ProductModel> products;

  Order({
    required this.confirmationId,
    required this.timestamp,
    required this.products,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      confirmationId: map['confirmationId'],
      timestamp: map['timestamp'],
      products: (map['products'] as List<dynamic>)
          .map((product) => ProductModel.fromMap(product))
          .toList(),
    );
  }
}
