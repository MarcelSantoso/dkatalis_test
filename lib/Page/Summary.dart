import 'package:dkatalis_test/Components/PageIndicator.dart';
import 'package:dkatalis_test/Helper/Constants.dart';
import 'package:dkatalis_test/Helper/Wgt.dart';
import 'package:dkatalis_test/Model/Data.dart';
import 'package:flutter/material.dart';

class Summary extends StatefulWidget {
  Data? model;
  Summary({this.model});
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: Wgt.appbar(title: "Create Account"),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(padding),
        child: Column(children: [
          SizedBox(height: padding),
          PageIndicator(activePos: 4),
          SizedBox(height: padding * 2),
          Text(
            "Success!",
            style: textWhiteLarge,
          ),
          SizedBox(height: padding),
          Container(
            padding: EdgeInsets.all(padding_s),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Icon(
              Icons.done,
              size: padding * 2,
              color: Colors.green,
            ),
          ),
          SizedBox(height: padding * 3),
          Center(
            child: Text(
              "Data JSON:",
              style: textWhite,
            ),
          ),
          SizedBox(height: padding),
          Text(
            "${widget.model?.parseAsJson()}",
            style: textWhite,
          )
        ]),
      ),
    );
  }
}
