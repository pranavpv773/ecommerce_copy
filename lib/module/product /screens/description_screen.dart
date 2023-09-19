import 'package:ecommerce/app/extensions.dart';
import 'package:ecommerce/module/product%20/cubit/product_cubit.dart';
import 'package:ecommerce/utils/animations/animate_search.dart';
import 'package:ecommerce/utils/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDescriptionScreen extends StatefulWidget {
  const ProductDescriptionScreen({super.key});

  @override
  State<ProductDescriptionScreen> createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context
        .read<ProductCubit>()
        .getProductDetailsFn(productId: context.args['id']);

    return Scaffold(body: SafeArea(
      child: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
        return state.productDescrStatus == ProductDescrStatus.loading
            ? const ShimmerListTile()
            : state.productDescrStatus == ProductDescrStatus.error
                ? const Text('Something went wrong')
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          hero(
                              image: state.productDescriptionData.images![0]
                                  .toString()),
                          Text(state.productDescriptionData.name.toString()),
                          Text(state.productDescriptionData.brand == null
                              ? 'N/A'
                              : state.productDescriptionData.brand!.brandName
                                  .toString()),
                          Container(
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                state.productDescriptionData.description
                                    .toString(),
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    height: 1.5, color: Color(0xFF6F8398)),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Coin"),
                              Text(state.productDescriptionData.price
                                  .toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Offer Coin"),
                              Text(state.productDescriptionData.offerPrice
                                  .toString()),
                            ],
                          ),
                          //  Property(),
                        ],
                      ),
                    ),
                  );
      }),
    ));
  }

  Widget appBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //  Image.asset("asset/bag.png"),
          Container(
            child: Column(
              children: const <Widget>[
                Text(
                  "MEN'S ORIGINAL",
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 14),
                ),
                Text(
                  "Smiths Shoes",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2F2F3E)),
                ),
              ],
            ),
          ),
          Image.asset(
            "asset/shirt.png",
            width: 27,
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget hero({required String image}) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: context.width,
            height: context.width / 1.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.contain),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 20,
            child: FloatingActionButton(
                elevation: 2,
                backgroundColor: Colors.white,
                onPressed: () {},
                child: const Icon(
                  Icons.favorite_outlined,
                  color: AppColours.grey,
                )),
          ),
        ],
      ),
    );
  }

  Widget Property() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Color"),
              Row(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.all(5),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.all(5),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.yellow, shape: BoxShape.circle),
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.all(5),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.pink, shape: BoxShape.circle),
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.all(5),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: const <Widget>[
              Text("Size"),
              Text(
                "10.1",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F2F3E)),
              )
            ],
          )
        ],
      ),
    );
  }
}
