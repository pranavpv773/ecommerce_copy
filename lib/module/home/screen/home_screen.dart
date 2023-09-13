import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:ecommerce/module/home/cubit/controller/home_controller.dart';
import 'package:ecommerce/module/home/cubit/home_cubit_cubit.dart';
import 'package:ecommerce/utils/common_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return GetBuilder<HomeController>(builder: (_) {
          return Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [],
            ),
          );
        });
      }),
    );
  }
}
