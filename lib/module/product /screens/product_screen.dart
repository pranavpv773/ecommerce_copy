import 'package:ecommerce/app/extensions.dart';
import 'package:ecommerce/module/favourites/screen/favourites.dart';
import 'package:ecommerce/utils/common_scaffold.dart';
import 'package:ecommerce/utils/helpers.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppbar(
      header: context.args['name'],
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Sort by'),
                  Icon(Icons.filter_alt_outlined)
                ],
              ),
              const SizeBoxH(20),
              GridView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: context.height / 2.7,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 25,
                itemBuilder: (BuildContext ctx, index) {
                  return const ProductCard(
                    assetName: "asset/shirt.png",
                  );
                },
              ),
            ],
          )),
    );
  }
}
