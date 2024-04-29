import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_care/core/constants/images.dart';
import 'package:health_care/features/auth/presentation/widgets/forget_pass_header.dart';
import 'package:health_care/features/auth/presentation/widgets/forget_pass_ways.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: 80,
        leading: InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 2,
            ),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                width: 1.5,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ForgetPassHeader(),
          ForgetPassWays(),
          _BottomLeftWidget(),
        ],
      ),
    );
  }
}

class _BottomLeftWidget extends StatelessWidget {
  const _BottomLeftWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Image.asset(Assets.assetsImagesForgetPassBottomLeft),
    );
  }
}
