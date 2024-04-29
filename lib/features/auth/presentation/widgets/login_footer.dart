import 'package:flutter/material.dart';
import 'package:health_care/core/constants/text_styles.dart';
import 'package:health_care/core/functions/navigation.dart';
import 'package:health_care/core/utils/strings.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        customReplacmentNavigation(context, AppStrings.welcomeScreenRoute);
      },
      child: const Text.rich(
        TextSpan(
          text: 'Don`t have an account? ',
          children: [
            TextSpan(
              text: 'Sign Up',
              style: MyTextStyles.blue,
            ),
          ],
        ),
      ),
    );
  }
}
