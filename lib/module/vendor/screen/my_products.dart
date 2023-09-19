import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/module/vendor/controller/vendor_controller.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/add_product_forms.dart';
import 'widget/dot_image.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  final VendorController controller = Get.put(VendorController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            title: const Text("Product Form"),
            centerTitle: true,
          ),
          backgroundColor: AppColors.grey,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  controller.images.isNotEmpty
                      ? const CarosalImageWidget()
                      : const DottedImageBorder(),
                  const SignupForm(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 120,
                          vertical: 15,
                        ),
                        backgroundColor: AppColors.secondary,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                      ),
                      onPressed: () {
                        controller.addProduct(context);
                      },
                      child: const Text(
                        "Add Product",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class CarosalImageWidget extends StatelessWidget {
  const CarosalImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VendorController controller = Get.put(VendorController());
    return GetBuilder<VendorController>(builder: (_) {
      return CarouselSlider(
        items: controller.images.map(
          (i) {
            return Builder(
              builder: (BuildContext context) => Image.file(
                i,
                fit: BoxFit.fitWidth,
                height: 200,
              ),
            );
          },
        ).toList(),
        options: CarouselOptions(
          reverse: false,
          viewportFraction: 1,
          height: 200,
        ),
      );
    });
  }
}
