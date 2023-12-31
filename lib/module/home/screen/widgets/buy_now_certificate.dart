import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/app/app_images/app_images.dart';
import 'package:ecommerce/utils/button.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/container.dart';
import 'package:ecommerce/utils/helpers.dart';
import 'package:ecommerce/utils/routes/app_routes.dart';
import 'package:ecommerce/utils/size.dart';

class BuyNowGreenCertificate extends StatelessWidget {
  const BuyNowGreenCertificate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonShadowContainer(
      child: Column(
        children: [
          Container(
            width: context.width,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Grand Prize",
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(
                    height: h8,
                  ),
                  Text(
                    "AED 10,000 * 12",
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ]),
          ),
          const SizeBoxH(h20),
          Container(
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(
                  AppImages.greenCertificatePath,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizeBoxH(h20),
          PrimaryCommonButton(
            onPressed: () {
              Get.toNamed(AppRoutes.buynowScreen);
            },
            label: 'BUY NOW',
          ),
        ],
      ),
    );
  }
}
