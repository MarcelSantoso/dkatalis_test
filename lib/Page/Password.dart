import 'package:dkatalis_test/Components/Button.dart';
import 'package:dkatalis_test/Components/PageIndicator.dart';
import 'package:dkatalis_test/Helper/Constants.dart';
import 'package:dkatalis_test/Helper/Helper.dart';
import 'package:dkatalis_test/Helper/Wgt.dart';
import 'package:flutter/material.dart';

import 'Personal.dart';

class Password extends StatefulWidget {
  Password({Key? key}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool isDisplayPassword = false;
  bool enableNext = false;
  bool isLower = false;
  bool isUpper = false;
  bool isNumber = false;
  bool isLength = false;

  var controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerPassword.addListener(() {
      setState(() {
        var text = controllerPassword.text;
        isLower = checkLowecase(text);
        isUpper = checkUppercase(text);
        isNumber = checkNumbers(text);
        isLength = checkLength(text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Wgt.appbar(title: "Create Account"),
      backgroundColor: colorPrimary,
      body: body(),
    );
  }

  Widget body() {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
          child: Container(
              padding: EdgeInsets.all(padding),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PageIndicator(activePos: 1),
                    SizedBox(height: padding),
                    Text("Create Password", style: textWhiteLarge),
                    SizedBox(height: padding_xs),
                    Text("Password will be used to login to account",
                        style: textWhite),
                    SizedBox(height: padding),
                    inputPassword(),
                    SizedBox(height: padding * 2),
                    Row(children: [
                      Text("Complexity: ", style: textWhite),
                      complexityText()
                    ]),
                    SizedBox(height: padding),
                    complexity(),
                    Spacer(),
                    SizedBox(height: padding),
                    SizedBox(
                        width: double.infinity,
                        child: Button(
                          text: "Next",
                          handler: enableNext ? () => nextPage() : null,
                          backgroundColor: colorLight,
                          textColor: colorPrimary,
                        )),
                    SizedBox(height: padding),
                  ])))
    ]);
  }

  Widget inputPassword() {
    return Container(
        padding: EdgeInsets.only(
            left: padding,
            top: padding_xs,
            bottom: padding_xs,
            right: padding_xs),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.white,
        ),
        child: TextField(
          controller: controllerPassword,
          obscureText: !isDisplayPassword,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => showPassword(),
              icon: Icon(
                  isDisplayPassword ? Icons.visibility_off : Icons.visibility),
            ),
            border: InputBorder.none,
            hintText: "Create Password",
            hintStyle: textHint,
          ),
        ));
  }

  Widget complexityOkay({val = false, text = ""}) {
    if (val) {
      return Container(
          padding: EdgeInsets.all(padding_xs),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(padding),
            color: Colors.green,
          ),
          child: Icon(
            Icons.check_outlined,
            color: Colors.white,
          ));
    } else {
      return Text("$text", style: textWhiteLargeNormal);
    }
  }

  Widget complexity() {
    return Row(children: [
      Expanded(
          child: Column(children: [
        complexityOkay(val: isLower, text: "a"),
        SizedBox(height: padding_xs),
        Text("Lowercase", style: textInfoSmall),
      ])),
      Expanded(
          child: Column(children: [
        complexityOkay(val: isUpper, text: "A"),
        SizedBox(height: padding_xs),
        Text("Uppercase", style: textInfoSmall),
      ])),
      Expanded(
          child: Column(children: [
        complexityOkay(val: isNumber, text: "123"),
        SizedBox(height: padding_xs),
        Text("Number", style: textInfoSmall),
      ])),
      Expanded(
          child: Column(children: [
        complexityOkay(val: isLength, text: "9+"),
        SizedBox(height: padding_xs),
        Text("Characters", style: textInfoSmall),
      ])),
    ]);
  }

  Widget complexityText() {
    enableNext = false;
    int score = 0;
    if (isLower) score++;
    if (isUpper) score++;
    if (isNumber) score++;
    if (isLength) score++;

    if (score == 0) return Container();

    switch (score) {
      case 1:
        return Text("Very Weak",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.orange,
              fontSize: 16,
            ));
      case 2:
        return Text("Weak",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.yellow[600]));
      case 3:
        return Text("Normal",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ));
      case 4:
        enableNext = true;
        return Text("Strong",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.greenAccent,
            ));
      default:
        return Text("");
    }
  }

  bool checkLowecase(text) {
    bool valid = RegExp(r"(.*[a-z].*)").hasMatch(text);
    return valid;
  }

  bool checkUppercase(text) {
    bool valid = RegExp(r"(.*[A-Z].*)").hasMatch(text);
    return valid;
  }

  bool checkNumbers(text) {
    bool valid = RegExp(r"(.*\d.*)").hasMatch(text);
    return valid;
  }

  bool checkLength(text) {
    bool valid = text != null && text.length > 9;
    return valid;
  }

  void showPassword() {
    setState(() {
      isDisplayPassword = !isDisplayPassword;
    });
  }

  void nextPage() {
    Helper.navigate(context, Personal());
  }
}
