import 'package:ecommerce/app/extensions.dart';
import 'package:ecommerce/module/product%20/cubit/product_cubit.dart';
import 'package:ecommerce/module/shop/cubit/cubit/shop_cubit.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/common_scaffold.dart';
import 'package:ecommerce/utils/helpers.dart';
import 'package:ecommerce/utils/routes/app_routes.dart';
import 'package:ecommerce/utils/size.dart';
import 'package:ecommerce/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    context.read<ShopCubit>().getCategoryFn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      child: BlocBuilder<ShopCubit, ShopState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      Get.toNamed(AppRoutes.productScreen, arguments: {
                        'name': state.categoryDataList[index].name.toString(),
                        // 'id': state.categoryDataList[index].id.toString(),
                      });
                      context.read<ProductCubit>().getAllProductsFn(
                          categoryId:
                              state.categoryDataList[index].id.toString());
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                state.categoryDataList[index].name.toString(),
                                textAlign: TextAlign.start,
                                style: context.textTheme.bodyLarge!
                                    .copyWith(fontSize: 18),
                              ),
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
                itemCount: state.categoryDataList.length)
          ]),
        );
      }),
    );
  }
}
