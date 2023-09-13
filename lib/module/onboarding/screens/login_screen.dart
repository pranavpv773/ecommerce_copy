// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ecommerce/module/onboarding/cubit/onboarding_cubit.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/helpers.dart';
import 'package:ecommerce/utils/size.dart';

import 'widgets/fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  OnboardingCubit get cubit => BlocProvider.of<OnboardingCubit>(context);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: context.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    "Login",
                    style: context.textTheme.bodyLarge!.copyWith(
                        fontSize: 48,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w900,
                        color: AppColors.black),
                  ),
                ),
                // SizedBox(
                //   width: 80,
                //   height: 80,
                //   child: Image.asset(AppImages.logoPath),
                // ),
                // const SizeBoxH(h32),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      VerificationFields(),
                      SizeBoxH(h32),
                      LoginButton(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OnboardingCubit>(context);
    return BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
      return SizedBox(
        height: 70,
        child: TextButton(
          onPressed: () {
            cubit.onLoginFn(context: context);
          },
          child: Ink(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: const Center(
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
