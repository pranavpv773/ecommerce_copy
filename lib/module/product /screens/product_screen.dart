import 'package:ecommerce/app/extensions.dart';
import 'package:ecommerce/module/favourites/screen/favourites.dart';
import 'package:ecommerce/module/product%20/cubit/product_cubit.dart';
import 'package:ecommerce/utils/common_scaffold.dart';
import 'package:ecommerce/utils/helpers.dart';
import 'package:ecommerce/utils/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppbar(
      header: context.args['name'],
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
            return state.allProductStatus == AllProductStatus.loading
                ? const ShimmerListTile()
                : Column(
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
                        itemCount: state.allProductDataList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return ProductCard(
                            productId:
                                state.allProductDataList[index].id.toString(),
                            assetName:
                                state.allProductDataList[index].images[3],
                            brandName:
                                state.allProductDataList[index].brand == null
                                    ? 'N/A'
                                    : state.allProductDataList[index].brand
                                        .toString(),
                            coin: state.allProductDataList[index].offerPrice
                                .toString(),
                            productName:
                                state.allProductDataList[index].name.toString(),
                          );
                        },
                      ),
                    ],
                  );
          })),
    );
  }
}
