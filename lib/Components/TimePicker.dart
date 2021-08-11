import 'dart:io';

import 'package:dkatalis_test/Helper/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatefulWidget {
  var handler;
  DateTime? selected;
  TimePicker({this.handler, this.selected});

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  DateTime? selectedTime, tempSelectedTime;
  late DateTime minTime, maxTime;

  @override
  void initState() {
    super.initState();

    if (widget.selected != null) selectedTime = widget.selected;
    DateTime dt = DateTime.now();
    minTime = DateTime(dt.year, dt.month, dt.day, 08, 0, 0);
    maxTime = DateTime(dt.year, dt.month, dt.day, 21, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat("HH:mm");

    String displayDate = selectedTime == null
        ? "- Choose Time -"
        : "${formatter.format(selectedTime!)}";
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(radius)),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: () => pickTime(context),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: padding,
                      right: padding,
                      top: padding_15,
                      bottom: padding_s),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Time", style: textInfoSmall),
                              Container(
                                padding:
                                    EdgeInsets.symmetric(vertical: padding_s),
                                width: double.infinity,
                                child: Text(
                                  "$displayDate",
                                  style: text,
                                ),
                              ),
                            ]),
                      ),
                      Icon(
                        Icons.expand_more_outlined,
                        color: colorTextHint,
                      ),
                    ],
                  ),
                ))));
  }

  Future<void> pickTime(context) async {
    DateTime dt;
    if (selectedTime == null)
      dt = DateTime.now();
    else
      dt = selectedTime!;

    tempSelectedTime = minTime;

    if (Platform.isAndroid) {
      androidDatePicker(dt);
    } else if (Platform.isIOS) {
      iosTimePicker(dt);
    }
  }

  Future<void> androidDatePicker(dt) async {
    TimeOfDay initial = TimeOfDay(hour: dt.hour, minute: dt.minute);
    TimeOfDay? t = await showTimePicker(
        context: context,
        initialTime: initial,
        helpText: "SCHEDULE VIDEO CALL",
        cancelText: "CANCEL",
        confirmText: "SCHEDULE");
    if (t != null) {
      var now = DateTime.now();
      selectedTime = DateTime(now.year, now.month, now.day, t.hour, t.minute);
      if (widget.handler != null) widget.handler(selectedTime);
      setState(() {});
    }
  }

  void iosTimePicker(dt) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 280,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: CupertinoDatePicker(
                        minimumDate: minTime,
                        maximumDate: maxTime,
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: minTime,
                        onDateTimeChanged: (val) {
                          tempSelectedTime = val;
                        }),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      CupertinoButton(
                        child: Text('CANCEL', style: textHint),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      CupertinoButton(
                        child: Text('SCHEDULE'),
                        onPressed: () {
                          setState(() {
                            selectedTime = tempSelectedTime;
                            tempSelectedTime = null;
                          });

                          Navigator.of(context).pop();
                          if (widget.handler != null)
                            widget.handler(selectedTime);
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ));
  }
}
