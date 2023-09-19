import 'package:ecommerce/app/extensions.dart';
import 'package:ecommerce/module/orders/cubit/order_cubit.dart';
import 'package:ecommerce/utils/apppref.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/helpers.dart';
import 'package:ecommerce/utils/shimmers.dart';
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
    print(AppPref.userToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("ORDERS"),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
        return state.orderStatus == GetOrderStatus.loading
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: ShimmerListTile(),
              )
            : state.orderStatus == GetOrderStatus.error
                ? const Center(child: Text('Something went wrong!'))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      itemCount: state.orderDataList.length,
                      separatorBuilder: (context, index) => const SizeBoxH(12),
                      itemBuilder: (context, index) {
                        final item = state.orderDataList[index];
                        return Material(
                          elevation: 6,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: 120,
                            width: context.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.grey.withOpacity(0.5))),
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
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item.productId!.name.toString(),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizeBoxV(5),
                                          Text(item.status.toString()),
                                        ],
                                      ),
                                      Text(
                                        item.productId!.brand == null
                                            ? 'N/A'
                                            : item.productId!.brand.toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
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
                  );
      }),
    );
  }
}
