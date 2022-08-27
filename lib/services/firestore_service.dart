import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/product_model.dart';

class FirestoreService {
  FirestoreService({required this.uid});
  final String uid;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addProduct(
    ProductModel product,
  ) async {
    final docId = firestore.collection("products").doc().id;
    await firestore.collection("products").doc(docId).set(product.toMap(docId));
  }

  Stream<List<ProductModel>> getProducts() {
    return firestore
        .collection("products")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final d = doc.data();
              return ProductModel.fromMap(d);
            }).toList());
  }

  Future<void> deleteProduct(String id) async {
    return await firestore.collection("products").doc(id).delete();
  }
}
