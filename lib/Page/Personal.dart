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
  List<String> dataGoal = ['Savings', 'Retirement funds', 'House', 'New phone'];
  List<String> dataIncome = ['Less than Rp. 10.000.000', 'Rp. 10.000.000 - Rp. 20.000.000', 'Rp. 20.000.000 - Rp. 50.000.000', 'More than Rp. 50.000.000'];
  List<String> dataExpense = ['Less than Rp. 5.000.000', 'Rp. 5.000.000 - Rp. 10.000.000', 'Rp. 10.000.000 - Rp. 20.000.000', 'More than Rp. 20.000.000'];

  String selectedGoal = "";
  String selectedIncome = "";
  String selectedExpense = "";
  bool enabledNext = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: Wgt.appbar(title: "Create Account"),
      body: body(),
    );
  }

  Widget body() {
    enabledNext =
        selectedGoal != "" && selectedIncome != "" && selectedExpense != "";
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
          SizedBox(height: padding),
          dropdown(
              title: "Goal for activation",
              data: dataGoal,
              selected: selectedGoal,
              handler: (selected) {
                setState(() {
                  selectedGoal = selected;
                });
              }),
          SizedBox(height: padding),
          dropdown(
              title: "Monthly income",
              data: dataIncome,
              selected: selectedIncome,
              handler: (selected) {
                setState(() {
                  selectedIncome = selected;
                });
              }),
          SizedBox(height: padding),
          dropdown(
              title: "Monthly expense",
              data: dataExpense,
              selected: selectedExpense,
              handler: (selected) {
                setState(() {
                  selectedExpense = selected;
                });
              }),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: Button(
              text: "Next",
              backgroundColor: Colors.white,
              textColor: colorPrimary,
              handler: enabledNext ? () => nextPage() : null,
            ),
          ),
          SizedBox(height: padding),
        ]),
      ))
    ]);
  }

  Container dropdown({title, List<String>? data, selected = "", handler}) {
    if (data == null) return Container();
    return Container(
        padding: EdgeInsets.only(left: padding, right: padding, top: padding_s),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(radius)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("$title", style: textInfoSmall),
          DropdownButton<String>(
            items: data.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            isExpanded: true,
            value: selected != "" ? selected : null,
            onChanged: (val) {
              handler(val);
            },
            hint: Text("- Choose Option -", style: text),
            underline: Container(),
          ),
        ]));
  }

  void nextPage() {
  }
}
