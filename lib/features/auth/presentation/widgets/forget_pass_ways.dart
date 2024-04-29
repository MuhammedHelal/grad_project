import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:health_care/core/functions/navigation.dart';
import 'package:health_care/core/utils/strings.dart';
import 'package:health_care/generated/l10n.dart';

class ForgetPassWays extends StatelessWidget {
  const ForgetPassWays({super.key});

  @override
  Widget build(BuildContext context) {
    final S local = S.of(context);
    final String emailTitle = local.emailAddress;
    final String emailSubtitle = local.sendViaEmailAddress;
    final String supportTitle = local.callSupport;
    final String supportSubtitle = local.callCustomerService;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              customNavigation(context, AppStrings.forgetPassSendEmailRouteString);
            },
            child: _CustomWay(
              icon: Icons.email,
              title: emailTitle,
              subtitle: emailSubtitle,
            ),
          ),
          const Gap(20),
          InkWell(
            onTap: () {},
            child: _CustomWay(
              icon: Icons.person_outline_rounded,
              title: supportTitle,
              subtitle: supportSubtitle,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomWay extends StatelessWidget {
  const _CustomWay({required this.icon, required this.title, required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final ThemeData myTheme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: myTheme.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 60,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: myTheme.colorScheme.onSecondary,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Icon(
              icon,
              color: myTheme.colorScheme.primary,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: myTheme.textTheme.headlineSmall,
                ),
                Text(
                  subtitle,
                  style: myTheme.textTheme.bodyMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
