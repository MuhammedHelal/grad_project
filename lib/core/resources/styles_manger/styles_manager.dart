import 'package:flutter/material.dart';

TextStyle _getTextStyle({
  double? fontSize,
  Color? color,
}) {
  return const TextStyle(
      fontSize: 15,
      color: Colors.blueAccent,
      fontWeight: FontWeight.bold
  );
}
TextStyle getMediumStyle({
  Color? color,
}) {
  return _getTextStyle(
    fontSize: 15,
    color: color,
  );
}