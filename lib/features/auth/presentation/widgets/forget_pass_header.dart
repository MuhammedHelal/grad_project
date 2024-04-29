import 'package:flutter/material.dart';
import 'package:health_care/generated/l10n.dart';

class ForgetPassHeader extends StatelessWidget {
  const ForgetPassHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final S local = S.of(context);
    final ThemeData myTheme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            local.forgetPasswordScreenTitle,
            style: myTheme.textTheme.headlineLarge,
          ),
          Text(
            S.of(context).forgetPasswordScreenSubTitle,
            style: myTheme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
