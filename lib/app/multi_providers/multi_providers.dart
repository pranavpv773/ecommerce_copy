import 'package:ecommerce/module/bag/cubit/my_bag_cubit.dart';
import 'package:ecommerce/module/favourites/cubit/favorites_cubit.dart';
import 'package:ecommerce/module/orders/cubit/order_cubit.dart';
import 'package:ecommerce/module/product%20/cubit/product_cubit.dart';
import 'package:ecommerce/module/shop/cubit/cubit/shop_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/module/global_screen/cubit/global_screen_cubit.dart';
import 'package:ecommerce/module/home/cubit/home_cubit_cubit.dart';
import 'package:ecommerce/module/onboarding/cubit/onboarding_cubit.dart';

var providers = [
  BlocProvider<HomeCubit>(
    create: (context) => HomeCubit(),
  ),
  BlocProvider<OnboardingCubit>(
    create: (context) => OnboardingCubit(),
  ),
  BlocProvider<ShopCubit>(
    create: (context) => ShopCubit(),
  ),
  BlocProvider<OrderCubit>(
    create: (context) => OrderCubit(),
  ),
  BlocProvider<ProductCubit>(
    create: (context) => ProductCubit(),
  ),
  BlocProvider<MyBagCubit>(
    create: (context) => MyBagCubit(),
  ),
  BlocProvider<FavoriteCubit>(
    create: (context) => FavoriteCubit(),
  ),
  BlocProvider<BottomNavCubit>(
    create: (context) => BottomNavCubit(),
  ),
];
