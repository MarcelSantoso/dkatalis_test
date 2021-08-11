import 'dart:io';

import 'package:dkatalis_test/Helper/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  var handler;
  DateTime? selected;
  DatePicker({this.handler, this.selected});

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate, tempSelectedDate;
  late DateTime minDate, maxDate;

  @override
  void initState() {
    super.initState();
    DateTime dt = DateTime.now();
    if (widget.selected != null){
      selectedDate = widget.selected;
    }
    minDate = DateTime(dt.year, dt.month, dt.day, 0, 0, 0);
    maxDate = DateTime(dt.year, dt.month + 1, dt.day, 08, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat("EEEE, dd MMM yyyy");
    String displayDate = selectedDate == null
        ? "- Choose Date -"
        : "${formatter.format(selectedDate!)}";
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(radius)),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: () => pickDate(context),
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
                              Text("Date", style: textInfoSmall),
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

  Future<void> pickDate(context) async {
    DateTime dt;
    if (selectedDate == null)
      dt = DateTime.now();
    else
      dt = selectedDate!;

    tempSelectedDate = minDate;

    if (Platform.isAndroid) {
      androidDatePicker(dt);
    } else if (Platform.isIOS) {
      iosDatePicker(dt);
    }
  }

  Future<void> androidDatePicker(dt) async {
    selectedDate = await showDatePicker(
        initialDatePickerMode: DatePickerMode.day,
        context: context,
        initialDate: dt,
        firstDate: minDate,
        lastDate: maxDate,
        helpText: "SCHEDULE VIDEO CALL",
        cancelText: "CANCEL",
        confirmText: "SCHEDULE");

    if (widget.handler != null) widget.handler(selectedDate);
    
    setState(() {});
  }

  void iosDatePicker(dt) {
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
                        minimumDate: minDate,
                        maximumDate: maxDate,
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: dt,
                        onDateTimeChanged: (val) {
                          tempSelectedDate = val;
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
                            selectedDate = tempSelectedDate;
                            tempSelectedDate = null;
                          });

                          Navigator.of(context).pop();
                          if (widget.handler != null)
                            widget.handler(selectedDate);
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
