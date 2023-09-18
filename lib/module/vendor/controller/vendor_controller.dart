// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:cloudinary/cloudinary.dart';

import 'package:file_picker/file_picker.dart';

class VendorController extends GetxController {
  final addProductKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final description = TextEditingController();
  final brand = TextEditingController();
  String category = "";
  final color = TextEditingController();
  final size = TextEditingController();
  final offer = TextEditingController();
  final price = TextEditingController();
  final material = TextEditingController();
  List<File> images = [];
  List<String> imageUrls = [];
  void addProduct() async {
    if (addProductKey.currentState!.validate() && images.isNotEmpty) {
      final cloudinary = Cloudinary.signedConfig(
        apiKey: "698566279964485",
        apiSecret: "rpCEvqOuNFwCYVXtMRxtCx9aOu4",
        cloudName: 'dr0cl0sic',
      );

      for (int i = 0; i < images.length; i++) {
        final file = File(images[i].path).readAsBytesSync();
        final response = await cloudinary.upload(
            file: images[i].path,
            fileBytes: file,
            resourceType: CloudinaryResourceType.image,
            folder: "menzclub",
            fileName: images[i].path,
            progressCallback: (count, total) {});
        imageUrls.add(response.secureUrl!);
      }
    }
  }

  void selectImages() async {
    var res = await pickImages();
    images = res;
    update();
  }

  Future<List<File>> pickImages() async {
    List<File> images = [];
    try {
      var files = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );
      if (files != null && files.files.isNotEmpty) {
        for (int i = 0; i < files.files.length; i++) {
          images.add(File(files.files[i].path!));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return images;
  }

  disposeControll() {
    name.clear();
    description.clear();
    price.clear();
    size.clear();
    offer.clear();
    color.clear();
    brand.clear();
    update();
  }
}
