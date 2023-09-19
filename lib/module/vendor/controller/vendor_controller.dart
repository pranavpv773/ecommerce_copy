// ignore_for_file: avoid_print

import 'package:ecommerce/module/vendor/services/my_product_services.dart';
import 'package:ecommerce/utils/animations/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:cloudinary/cloudinary.dart';

import 'package:file_picker/file_picker.dart';

class VendorController extends GetxController {
  MyProductServices services = MyProductServices();

  final addProductKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final description = TextEditingController();
  final brand = TextEditingController();
  String category = "";
  final quantity = TextEditingController();
  final shippingCahrge = TextEditingController();
  final offer = TextEditingController();
  final price = TextEditingController();
  final material = TextEditingController();
  List<File> images = [];
  List<String> imageUrls = [];
  void addProduct(BuildContext context) async {
    if (addProductKey.currentState!.validate() && images.isNotEmpty) {
      LoadingOverlay.of(context).show();
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
            folder: "ecommerce",
            fileName: images[i].path,
            progressCallback: (count, total) {});
        imageUrls.add(response.secureUrl!);
      }
    }
    var data = {
      "name": name.text,
      "description": description.text,
      "price": price.text,
      "offer_price": offer.text,
      "quantity": quantity.text,
      "shipping_charges": shippingCahrge.text,
      "brand": "650285aabd4216efbb32574b",
      "category": "64fb0d9d8b40210894da5502",
      "images": imageUrls,
      "country": "IN"
    };
    try {
      final list = await services.postProductsApi(body: data);
      print("Product length: ${list['statusCode']}");
      Get.snackbar('Success', 'Your product sent for review',
          snackPosition: SnackPosition.BOTTOM);

      LoadingOverlay.of(context).hide();
      // ignore: deprecated_member_use
    } on DioError catch (_) {
      LoadingOverlay.of(context).hide();
      Get.snackbar('Error', _.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
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
    quantity.clear();
    offer.clear();
    shippingCahrge.clear();
    brand.clear();
    update();
  }
}
