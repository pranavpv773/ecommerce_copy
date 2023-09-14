import 'package:ecommerce/utils/animations/animate_search.dart';
import 'package:flutter/material.dart';

class ProductDescriptionScreen extends StatefulWidget {
  const ProductDescriptionScreen({super.key});

  @override
  State<ProductDescriptionScreen> createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    var description = Container(
        padding: const EdgeInsets.all(16),
        child: const Text(
          "A style icon gets some love from one of today's top "
          "trendsetters. Pharrell Williams puts his creative spin on these "
          "shoes, which have all the clean, classicdetails of the beloved Stan Smith.",
          textAlign: TextAlign.justify,
          style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
        ));
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          hero(),
          description,
          Property(),
        ],
      ),
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

  Widget hero() {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            "asset/shirt.png",
          ), //This
          // should be a paged
          // view.

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
