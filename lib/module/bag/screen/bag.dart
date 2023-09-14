import 'package:ecommerce/app/extensions.dart';
import 'package:ecommerce/utils/button.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/common_scaffold.dart';
import 'package:ecommerce/utils/helpers.dart';
import 'package:ecommerce/utils/size.dart';
import 'package:ecommerce/utils/texts.dart';
import 'package:flutter/material.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderTitle(
            title: "My Bag",
          ),
          const SizeBoxH(h12),
          ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) => const SizeBoxH(h12),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 9,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: context.width,
                  height: 120,
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 90,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("asset/apple.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: context.width,
                            child: const ListTile(
                              title: Text("T-Shirt"),
                              subtitle: Text("Brand"),
                              trailing: Icon(
                                Icons.delete_outline_outlined,
                                color: Color(0xff9B9B9B),
                              ),
                            ),
                          ),
                          const SizeBoxH(4),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Material(
                                      elevation: 9,
                                      shadowColor: Colors.black87,
                                      borderRadius: BorderRadius.circular(20),
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.white,
                                        radius: 20,
                                        child: const Align(
                                          alignment: Alignment.topCenter,
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
                                      style: context.textTheme.bodySmall,
                                    ),
                                    const SizeBoxV(10),
                                    Material(
                                      elevation: 9,
                                      borderRadius: BorderRadius.circular(20),
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.white,
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
                                const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(r"30$"),
                                )
                              ],
                            ),
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
                "Total amount:",
                style: context.textTheme.labelMedium!.copyWith(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.10,
                ),
              ),
              Text(
                r"112$",
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
            bgColor: AppColors.primary,
            btnHeight: 48,
          ),
          const SizeBoxH(12),
        ],
      ),
    ));
  }
}
