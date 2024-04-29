import 'package:flutter/foundation.dart';
import 'package:telephony/telephony.dart';

abstract class MySms {
  static final Telephony _telephony = Telephony.instance;

  static Future<void> sendSms({required String phoneNumber, required String text}) async {
    bool? permissionsGranted = await _telephony.requestPhoneAndSmsPermissions;
    if (permissionsGranted == true) {
      listener(SendStatus status) {
        debugPrint(status.name);
      }

      await _telephony.sendSms(
        to: phoneNumber,
        message: text,
        statusListener: listener,
      );
    }
  }
}
