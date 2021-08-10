import 'package:flutter/material.dart';

import 'Constants.dart';

class Wgt {
  static AppBar appbar({title}) {
    return AppBar(
      title: Text("$title"),
      centerTitle: false,
      backgroundColor: colorPrimary,
      shadowColor: Colors.transparent,
    );
  }
}
