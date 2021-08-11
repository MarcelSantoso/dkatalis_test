import 'dart:io';

import 'package:dkatalis_test/Components/Button.dart';
import 'package:dkatalis_test/Components/DatePicker.dart';
import 'package:dkatalis_test/Components/PageIndicator.dart';
import 'package:dkatalis_test/Components/GlowingWidget.dart';
import 'package:dkatalis_test/Components/TimePicker.dart';
import 'package:dkatalis_test/Helper/Constants.dart';
import 'package:dkatalis_test/Helper/Helper.dart';
import 'package:dkatalis_test/Helper/Wgt.dart';
import 'package:dkatalis_test/Model/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Summary.dart';

class VideoCall extends StatefulWidget {
  Data? model;
  VideoCall({this.model});
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  DateTime? selectedDate, selectedTime;
  bool enableNext = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: Wgt.appbar(title: "Create Account"),
      body: body(),
    );
  }

  Widget body() {
    enableNext = selectedDate != null && selectedTime != null;
    return CustomScrollView(slivers: [
      SliverFillRemaining(
          child: Container(
        padding: EdgeInsets.all(padding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: padding),
          PageIndicator(activePos: 3),
          SizedBox(height: padding_s),
          Container(
              height: 70,
              width: 70,
              child: Center(
                  child: GlowingWidget(
                child: Icon(
                  Icons.event,
                  color: colorPrimary,
                ),
              ))),
          SizedBox(height: padding_s),
          Text(
            "Schedule Video Call",
            style: textWhiteLarge,
          ),
          SizedBox(height: padding_xs),
          Text(
            "Choose the date and time that you preferred, we will send a link via email to make a video call on the scheduled date and time.",
            style: textWhite,
          ),
          SizedBox(height: padding * 2),
          DatePicker(
              selected: widget.model?.scheduleDate,
              handler: (val) {
                setState(() {
                  this.selectedDate = val;
                });
              }),
          SizedBox(height: padding),
          TimePicker(
              selected: widget.model?.scheduleTime,
              handler: (val) {
                setState(() {
                  this.selectedTime = val;
                });
              }),
          SizedBox(height: padding),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: Button(
              text: "Next",
              backgroundColor: Colors.white,
              textColor: colorPrimary,
              handler: enableNext ? () => nextPage() : null,
            ),
          ),
          SizedBox(height: padding),
        ]),
      ))
    ]);
  }

  void nextPage() {
    widget.model?.scheduleDate = selectedDate;
    widget.model?.scheduleTime = selectedTime;
    Helper.navigate(context, Summary(model: widget.model));
  }
}
