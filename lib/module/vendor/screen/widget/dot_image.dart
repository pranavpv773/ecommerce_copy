import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce/module/vendor/controller/vendor_controller.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DottedImageBorder extends StatelessWidget {
  const DottedImageBorder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VendorController controller = Get.put(VendorController());
    return GetBuilder<VendorController>(builder: (_) {
      return GestureDetector(
        onTap: controller.selectImages,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DottedBorder(
            color: AppColors.white,
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            dashPattern: const [20, 8],
            strokeCap: StrokeCap.round,
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.folder_open,
                    color: AppColors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Select Product Images',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.white,
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
