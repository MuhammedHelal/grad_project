import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:health_care/core/constants/colors.dart';
import 'package:health_care/core/constants/text_styles.dart';
import 'package:health_care/core/functions/navigation.dart';
import 'package:health_care/core/utils/strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'WELCOME TO ****',
            style: MyTextStyles.blackBold16,
          ),
          const Gap(30),
          /*  Image.asset(
            Assets.assetsImagesAppImagesLogo,
            height: 300,
          ),*/
          const Gap(30),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      customNavigation(context, AppStrings.signUpRoute, extra: true);
                    },
                    child: Container(
                      height: 70,
                      width: size.width * 0.4,
                      decoration: const BoxDecoration(
                        color: AppColors.cyan,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'FAMILY MEMBER',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      customNavigation(context, AppStrings.signUpRoute, extra: false);
                    },
                    child: Container(
                      height: 70,
                      width: size.width * 0.4,
                      decoration: const BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'USER',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(10),
            ],
          ),
        ],
      ),
    );
  }
}
