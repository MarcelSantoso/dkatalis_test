import 'package:dkatalis_test/Components/Button.dart';
import 'package:dkatalis_test/Components/PageIndicator.dart';
import 'package:dkatalis_test/Helper/Constants.dart';
import 'package:dkatalis_test/Helper/Wgt.dart';
import 'package:flutter/material.dart';

class Personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: Wgt.appbar(title: "Create Account"),
      body: body(),
    );
  }

  Widget body() {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
          child: Container(
        padding: EdgeInsets.all(padding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: padding),
          PageIndicator(activePos: 2),
          SizedBox(height: padding * 2),
          Text(
            "Personal Information",
            style: textWhiteLarge,
          ),
          SizedBox(height: padding_xs),
          Text(
            "Please fill in the information below and your goal for digital saving.",
            style: textWhite,
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: Button(
              text: "Next",
              backgroundColor: Colors.white,
              textColor: colorPrimary,
            ),
          ),
          SizedBox(height: padding),
        ]),
      ))
    ]);
  }
}
