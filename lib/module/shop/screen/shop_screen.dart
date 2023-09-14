import 'package:ecommerce/app/extensions.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/common_scaffold.dart';
import 'package:ecommerce/utils/helpers.dart';
import 'package:ecommerce/utils/routes/app_routes.dart';
import 'package:ecommerce/utils/size.dart';
import 'package:ecommerce/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List category = ['Mobiles', 'Fashion', 'Home', 'Appliances', 'Toys'];
    return CommonScaffold(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const HeaderTitle(
            title: "Categories",
          ),
          const SizeBoxH(h12),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.productScreen,
                        arguments: {'name': category[index]});
                  },
                  child: Material(
                    elevation: 9,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 120,
                      width: context.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white),
                      child: Row(children: [
                        Expanded(
                          child: Text(
                            category[index],
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyLarge!
                                .copyWith(fontSize: 24),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage('asset/product1.jpg'),
                                  fit: BoxFit.fill)),
                        ))
                      ]),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizeBoxH(20),
              itemCount: category.length)
        ]),
      ),
    );
  }
}
