import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class BagViewModel extends ChangeNotifier {
  final List<ProductModel> productsBag;

  BagViewModel() : productsBag = [];

  void addProduct(ProductModel product) {
    productsBag.add(product);
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    productsBag.remove(product);
    notifyListeners();
  }

  void clearBag(ProductModel product) {
    productsBag.clear();
    notifyListeners();
  }

  int get totalProducts => productsBag.length;
  double get totalPrice => productsBag.fold(
        0,
        (total, product) {
          return total + product.price;
        },
      );

  bool get isBagEmpty => productsBag.isEmpty;
}
