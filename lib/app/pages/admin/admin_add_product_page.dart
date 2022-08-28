import 'dart:io';

import 'package:e_commerce_app/app/providers.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

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
      final fileStorage = ref.read(storageProvider);
      final imageFile = ref.read(addImageProvider);
      final storage = ref.read(databaseProvider);
      if (storage == null || fileStorage == null || imageFile == null) {
        print("Error: storage, fileStoreage or imageFile is null");
        return;
      }
      final imageUrl = await fileStorage.uploadFile(imageFile.path);
      await storage.addProduct(
        ProductModel(
            name: titleTextEditingController.text,
            description: descriptionEditingController.text,
            price: double.parse(priceEditingController.text),
            imageUrl: imageUrl),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
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
              const SizedBox(height: 15),
              Consumer(
                builder: (context, watch, child) {
                  final image = ref.watch(addImageProvider);
                  return image == null
                      ? const Text('No image selected')
                      : Image.file(
                          File(image.path),
                          height: 200,
                        );
                },
              ),
              ElevatedButton(
                child: const Text("upload image"),
                onPressed: () async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    ref.watch(addImageProvider.state).state = image;
                  }
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () => _addProduct(),
                  child: const Text(" Add Product")),
            ],
          ),
        ),
      ),
    );
  }
}
