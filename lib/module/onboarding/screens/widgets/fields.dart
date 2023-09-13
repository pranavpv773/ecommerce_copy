import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ecommerce/module/onboarding/cubit/onboarding_cubit.dart';
import 'package:ecommerce/utils/text_form_field.dart';

class VerificationFields extends StatelessWidget {
  const VerificationFields({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OnboardingCubit>(context);

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
              elevation: 6,
              shadowColor: AppColors.black,
              borderRadius: BorderRadius.circular(4),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CommonTextField(
                  controller: state.emailController,
                  onChanged: (value) {
                    if (state.isValidEmail == false) {
                      cubit.validLoginEmail();
                    }
                  },
                  hintText: "Email",
                ),
              ),
            ),
            state.isValidEmail
                ? const SizedBox.shrink()
                : const ValidationText(
                    validationText: "Please enter a valid email",
                  ),
            const SizeBoxH(8),
            const PasswordField(),
            state.isValidPassword
                ? const SizedBox.shrink()
                : const ValidationText(
                    validationText: "Password must be greater than 7 letters",
                  ),
          ],
        );
      },
    );
  }
}

class ValidationText extends StatelessWidget {
  final String validationText;
  const ValidationText({
    super.key,
    required this.validationText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        validationText,
        style: context.textTheme.bodySmall!.copyWith(
          color: Colors.red,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _ishidden = true;

  void _toggleVisibility() {
    setState(
      () {
        _ishidden = !_ishidden;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OnboardingCubit>(context);

    return BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
      return Material(
        elevation: 6,
        shadowColor: AppColors.black,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: CommonTextField(
            onChanged: (value) {
              if (state.isValidPassword == false) {
                cubit.onPasswordChanged();
              }
            },
            controller: state.passwordController,
            hintText: "Password",
            suffixIcon: IconButton(
              icon: Icon(
                _ishidden ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: _toggleVisibility,
            ),
          ),
        ),
      );
    });
  }
}
