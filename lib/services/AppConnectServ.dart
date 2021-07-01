import 'package:flutter/material.dart';

abstract class AppConnectServ {
  static Future<void> registrationUserEmail({
    @required String emailText,
    @required String passwordText,
  }) async {}

  static Future<void> getCurrentUser() async {}
}
