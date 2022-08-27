import 'package:e_commerce_app/app/providers.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminAddProductPage extends ConsumerStatefulWidget {
  const AdminAddProductPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdminAddProductPageState();
}

class _AdminAddProductPageState extends ConsumerState<AdminAddProductPage> {
  final titleTextEditingController = TextEditingController();
  final priceEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _addProduct() async {
      final storage = ref.read(databaseProvider);
      if (storage == null) {
        return;
      }
      await storage.addProduct(
        ProductModel(
            name: titleTextEditingController.text,
            description: descriptionEditingController.text,
            price: double.parse(priceEditingController.text),
            imageUrl: "image"),
      );
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            CustomInputFieldFb1(
                inputController: titleTextEditingController,
                hintText: "Product Name",
                labelText: "Product Name"),
            const SizedBox(height: 15),
            CustomInputFieldFb1(
              inputController: descriptionEditingController,
              labelText: 'Product Description',
              hintText: 'Product Description',
            ),
            const SizedBox(height: 15),
            CustomInputFieldFb1(
              inputController: priceEditingController,
              labelText: 'Price',
              hintText: 'Price',
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () => _addProduct(),
                child: const Text(" Add Product"))
          ],
        ),
      ),
    );
  }
}
