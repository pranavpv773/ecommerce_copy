import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

class AddProductTextforms extends StatelessWidget {
  const AddProductTextforms({
    Key? key,
    required this.icon,
    required this.text,
    required this.obscureText,
    required this.vertical,
    required this.controller,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final bool obscureText;
  final double vertical;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill this field';
          }
        },
        controller: controller,
        style: TextStyle(
          color: AppColors.grey,
          fontSize: 18,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              icon,
              color: AppColors.primary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.teal,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 2.0,
            ),
          ),
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 16,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
