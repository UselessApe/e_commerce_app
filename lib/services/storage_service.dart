import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  StorageService({required this.uid});
  final String uid;

  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadFile(String filePath) async {
    try {
      final dateTime = DateTime.now().toIso8601String();
      final ref = storage.ref("$uid/$DateTime");
      final UploadTask = await ref.putFile(File(filePath));
      return await UploadTask.ref.getDownloadURL();
    } catch (e) {
      print("error occured");
    }
    return "";
  }
}
