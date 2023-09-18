import 'package:ecommerce/app/extensions.dart';
import 'package:ecommerce/module/orders/cubit/order_cubit.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    context.read<OrderCubit>().getMyOrdersFn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("ORDERS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const SizeBoxH(12),
          itemBuilder: (context, index) {
            return Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 120,
                width: context.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grey.withOpacity(0.5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 90,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("asset/shirt.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Name"),
                              Text("Deliverd"),
                            ],
                          ),
                          const Text("Brand"),
                          const Text("data")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
