import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:health_care/core/constants/text_styles.dart';
import 'package:health_care/features/auth/presentation/widgets/login_footer.dart';
import 'package:health_care/features/auth/presentation/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(100),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Sign in',
                  style: MyTextStyles.blackBold24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: LoginForm(),
            ),
            Gap(10),
            LoginFooter(),
          ],
        ),
      ),
    );
  }
}
