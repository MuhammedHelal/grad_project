import 'package:flutter/material.dart';
import 'package:health_care/core/constants/colors.dart';

abstract class MyTextStyles {
  static const TextStyle greenTitle = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );
  static const TextStyle greenTitleSmall = TextStyle(
    color: AppColors.greenishBlue,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static const TextStyle blue = TextStyle(
    color: AppColors.bluePrimary,
    fontSize: 17,
  );
  static const TextStyle greenSmall = TextStyle(
    color: AppColors.greenishBlue,
    fontSize: 16,
  );
  static const TextStyle grey = TextStyle(
    color: Colors.grey,
    fontSize: 18,
  );

  static const TextStyle whiteBold = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static const TextStyle whiteBold18 = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static const TextStyle blackBold16 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static const TextStyle blackBold20 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static const TextStyle blackBold24 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
}

abstract class MyInputDecorationsStyles {
  static const InputDecoration signup = InputDecoration(
    contentPadding: EdgeInsets.all(20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
  );
}
