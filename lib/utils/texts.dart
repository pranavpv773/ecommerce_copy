import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.headlineLarge!.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
