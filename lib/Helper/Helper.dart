import 'dart:io';

import 'package:dkatalis_test/Helper/Constants.dart';
import 'package:flutter/material.dart';

class Helper {
  static bool validateEmail({email}) {
    if (email == null) return false;
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static void navigate(context, page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static double getHeight(context, {noAppbar = false}) {
    var top = MediaQuery.of(context).padding.top;
    var bottom = MediaQuery.of(context).viewInsets.bottom;
    var multiplier = 2;
    if (Platform.isAndroid) {
      bottom = bottom * 0.3;

      if (noAppbar) {
        top -= AppBar().preferredSize.height * 1.5;
      }
    } else if (Platform.isIOS) {
      multiplier = 3;

      if (noAppbar) {
        top -= AppBar().preferredSize.height * 2;
        bottom *= 0.7;
      }
    }

    return MediaQuery.of(context).size.height -
        top -
        bottom -
        padding * multiplier;
  }
}
