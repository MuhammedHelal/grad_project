import 'package:flutter/material.dart';
import 'package:health_care/generated/l10n.dart';

String? validateTextFormField(value, {required BuildContext context}) {
  if (value!.isEmpty) {
    return S.of(context).requiredField;
  } else {
    return null;
  }
}
