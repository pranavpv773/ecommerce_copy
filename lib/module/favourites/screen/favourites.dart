import 'package:ecommerce/module/favourites/cubit/favorites_cubit.dart';
import 'package:ecommerce/utils/button.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/common_scaffold.dart';
import 'package:ecommerce/utils/routes/app_routes.dart';
import 'package:ecommerce/utils/shimmers.dart';
import 'package:ecommerce/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../utils/helpers.dart';
import '../../../utils/size.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    context.read<FavoriteCubit>().getFavoriteFn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(builder: (context, state) {
      return CommonScaffold(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderTitle(
              title: "Favorites",
            ),
            const SizeBoxH(h12),
            state.favoriteStatus == FavoriteStatus.loading
                ? const ShimmerListTile()
                : GridView.builder(
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
                    itemCount: state.favorites.products!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final item = state.favorites.products![index];
                      return ProductCard(
                        assetName: item.images![0],
                        brandName: item.brand.toString(),
                        coin: item.offerPrice.toString(),
                        productName: item.name.toString(),
                      );
                    },
                  ),
          ],
        ),
      ));
    });
  }
}

class ProductCard extends StatelessWidget {
  final String assetName;
  final String productName;
  final String brandName;
  final String coin;
  const ProductCard({
    super.key,
    required this.assetName,
    required this.brandName,
    required this.coin,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.productDescriptionScreen);
      },
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 9,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(assetName),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.favorite_rounded,
                    color: AppColors.red,
                  ),
                ),
              ),
              const SizeBoxH(4),
              RatingBar.builder(
                initialRating: 3.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 18,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              const SizeBoxH(4),
              Text(
                productName,
                overflow: TextOverflow.ellipsis,
              ),
              const SizeBoxH(2),
              Text(
                brandName,
                overflow: TextOverflow.ellipsis,
              ),
              const SizeBoxH(2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Coin"),
                  Text(coin),
                ],
              ),
              const SizeBoxH(4),
              CommonButtonV1(label: 'Add to Bag', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
