import 'package:flutter/material.dart';
import 'package:health_care/core/constants/colors.dart';

class ProfileItemContainer extends StatelessWidget {
  const ProfileItemContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.bluePrimary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
