import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:health_care/core/constants/text_styles.dart';
import 'package:health_care/core/functions/navigation.dart';
import 'package:health_care/core/utils/strings.dart';
import 'package:health_care/features/auth/auth_cubit/auth_cubit.dart';
import 'package:health_care/features/auth/presentation/widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    authCubit.isObserver ? 'Family Sign Up' : 'User Sign Up',
                    style: MyTextStyles.blackBold24,
                  ),
                ),
                const Gap(30),
                const SignUpForm(),
                const Gap(10),
                TextButton(
                  onPressed: () {
                    customReplacmentNavigation(context, AppStrings.signInRoute);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Already a member? ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: const [
                        TextSpan(
                          text: 'Sign in',
                          style: MyTextStyles.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
