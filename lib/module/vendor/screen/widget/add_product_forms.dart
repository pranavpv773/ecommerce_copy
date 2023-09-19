import 'package:ecommerce/module/vendor/controller/vendor_controller.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'text_form.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VendorController controller = Get.put(VendorController());

    return GetBuilder<VendorController>(builder: (_) {
      return SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Form(
          key: controller.addProductKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // const ImageProfileAdd(),
                AddProductTextforms(
                  icon: Icons.person_outline_outlined,
                  text: "Name",
                  obscureText: false,
                  vertical: 20,
                  controller: controller.name,
                ),
                AddProductTextforms(
                  maxLines: 50,
                  minLines: 15,
                  icon: Icons.document_scanner_rounded,
                  text: "Description",
                  obscureText: false,
                  vertical: 20,
                  prefixIcon: const SizedBox.shrink(),
                  controller: controller.description,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 6,
                      child: AddProductTextforms(
                        keyboardType: TextInputType.number,
                        icon: Icons.price_check,
                        text: "Price",
                        obscureText: false,
                        vertical: 20,
                        controller: controller.price,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: AddProductTextforms(
                        keyboardType: TextInputType.number,
                        icon: Icons.discount_outlined,
                        text: "Offer",
                        obscureText: false,
                        vertical: 20,
                        controller: controller.offer,
                      ),
                    ),
                  ],
                ),
                // AddProductTextforms(
                //   icon: Icons.person_outline_outlined,
                //   text: "Category",
                //   obscureText: false,
                //   vertical: 20,
                //   controller: controller.category,
                // ),

                AddProductTextforms(
                  keyboardType: TextInputType.number,
                  icon: Icons.travel_explore_rounded,
                  text: "Shipping charges",
                  obscureText: false,
                  vertical: 15,
                  controller: controller.shippingCahrge,
                ),
                AddProductTextforms(
                  keyboardType: TextInputType.number,
                  icon: Icons.numbers_rounded,
                  text: "Quantity",
                  obscureText: false,
                  vertical: 15,
                  controller: controller.quantity,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class DescriptionTextforms extends StatelessWidget {
  const DescriptionTextforms({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: 15,
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill this field';
          }
        },
        controller: controller,
        style: TextStyle(
          color: AppColors.grey,
          fontSize: 18,
        ),
        decoration: InputDecoration.collapsed(
          fillColor: AppColors.white,
          filled: true,
          // prefixIcon: Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 5.0),
          //   child: Icon(
          //     icon,
          //     color: primary,
          //   ),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          //   borderSide: BorderSide(
          //     color: primary,
          //     width: 2.0,
          //   ),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          //   borderSide: const BorderSide(
          //     color: Colors.teal,
          //     width: 2.0,
          //   ),
          // ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 2.0,
            ),
          ),
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 16,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
