import 'package:ecommerce/app/extensions.dart';
import 'package:ecommerce/module/bag/cubit/my_bag_cubit.dart';
import 'package:ecommerce/utils/button.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/common_scaffold.dart';
import 'package:ecommerce/utils/helpers.dart';
import 'package:ecommerce/utils/shimmers.dart';
import 'package:ecommerce/utils/size.dart';
import 'package:ecommerce/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  void initState() {
    context.read<MyBagCubit>().getAllCartItemsFn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<MyBagCubit, MyBagState>(builder: (context, state) {
        return state.cartStatus == CartStatus.loading
            ? const ShimmerListTile()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderTitle(
                    title: "My Bag",
                  ),
                  const SizeBoxH(h12),
                  ListView.separated(
                    itemCount: state.cartDataList.length,
                    separatorBuilder: (context, index) => const SizeBoxH(h12),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = state.cartDataList[index];
                      return Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 9,
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: context.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        item.productId!.images![1]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.productId!.name.toString(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    item.productId!.brand!.brandName.toString(),
                                  ),
                                  const SizeBoxH(4),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Material(
                                              elevation: 9,
                                              shadowColor: Colors.black87,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    AppColors.white,
                                                radius: 20,
                                                child: const Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Icon(
                                                    Icons.minimize_rounded,
                                                    color: Color(0xff9B9B9B),
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizeBoxV(10),
                                            Text(
                                              "1",
                                              style:
                                                  context.textTheme.bodySmall,
                                            ),
                                            const SizeBoxV(10),
                                            Material(
                                              elevation: 9,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    AppColors.white,
                                                radius: 20,
                                                child: const Align(
                                                  alignment: Alignment.center,
                                                  child: Icon(
                                                    Icons.add_rounded,
                                                    color: Color(0xff9B9B9B),
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item.productId!.price.toString(),
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationThickness: 2.0,
                                          decorationColor: Colors.red,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item.productId!.offerPrice.toString(),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizeBoxH(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Coin:",
                        style: context.textTheme.labelMedium!.copyWith(
                          color: AppColors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.10,
                        ),
                      ),
                      Text(
                        state.myBagModel.data!.totalPrice.toString(),
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  const SizeBoxH(30),
                  CommonButtonV1(
                    onPressed: () {},
                    label: 'CHECK OUT',
                    bgColor: AppColors.btnColor,
                    btnHeight: 48,
                  ),
                  const SizeBoxH(12),
                ],
              );
      }),
    ));
  }
}
