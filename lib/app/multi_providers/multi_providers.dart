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
  BlocProvider<BottomNavCubit>(
    create: (context) => BottomNavCubit(),
  ),
];
