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
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return null;
            },
          )
        ],
      ),
    ));
  }
}
