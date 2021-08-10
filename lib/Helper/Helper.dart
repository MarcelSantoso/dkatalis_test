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
}
