import 'package:flutter/material.dart';
import 'package:health_care/core/resources/image_maneger/image_manger.dart';
import 'package:health_care/core/resources/styles_manger/styles_manager.dart';

class CustomTabWidget extends StatelessWidget {
  final String mainText;
  final String additionalInfo;
  final String firstIcon;

  const CustomTabWidget({
    super.key,
    required this.mainText,
    required this.additionalInfo,
    required this.firstIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 15.0, bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(firstIcon),
          ),
          const SizedBox(width: 5),
          Text(
            '$mainText:',
            style: getMediumStyle(color: Colors.blueAccent),
          ),
          const SizedBox(width: 5),
          Text(additionalInfo),
          const Spacer(),
          const Image(
            image: AssetImage(ImagesManager.wrongGrey),
          ),
          const SizedBox(width: 5),
          const Image(
            image: AssetImage(ImagesManager.rightGreen),
          ),
        ],
      ),
    );
  }
}
