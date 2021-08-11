import 'package:dkatalis_test/Components/Button.dart';
import 'package:dkatalis_test/Components/PageIndicator.dart';
import 'package:dkatalis_test/Helper/Constants.dart';
import 'package:dkatalis_test/Helper/Helper.dart';
import 'package:dkatalis_test/Model/Data.dart';
import 'package:flutter/material.dart';

import 'Password.dart';

class Home extends StatefulWidget {
  Data? model;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controllerEmail = TextEditingController();
  bool enableNext = false;

  @override
  void initState() {
    super.initState();

    if (widget.model == null) {
      widget.model = Data();
    } else {
      controllerEmail.text = widget.model?.email ?? "";
    }
    
    controllerEmail.addListener(() {
      setState(() {
        enableNext = Helper.validateEmail(email: controllerEmail.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        color: colorPrimary,
      ),
      Image.asset("assets/background.png"),
      Container(
          child: CustomScrollView(slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Column(children: <Widget>[
              SizedBox(height: space_header),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: PageIndicator(),
              ),
              SizedBox(height: padding),
              Image.asset("assets/background_overlay.png"),
              Expanded(
                  child: Container(
                      color: colorBg,
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                    style: textWelcome,
                                    children: <TextSpan>[
                                  TextSpan(text: 'Welcome to\nGIN '),
                                  TextSpan(
                                      text: 'Finans', style: textWelcomeAccent),
                                ])),
                            SizedBox(height: padding),
                            Text(
                              'Welcome to The Bank of The Future.\nManage and track your accounts on the go.',
                              style: textIntro,
                            ),
                            SizedBox(height: padding),
                            Card(
                                elevation: 5,
                                shadowColor: Colors.grey[200],
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: padding,
                                        vertical: padding_xs),
                                    child: textField())),
                            SizedBox(height: padding),
                            Spacer(),
                            SizedBox(
                                width: double.infinity,
                                child: Button(
                                  text: "Next",
                                  handler: enableNext ? () => nextPage() : null,
                                )),
                            SizedBox(height: padding * 2),
                          ]))),
            ]))
      ]))
    ]));
  }

  Widget textField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: controllerEmail,
      decoration: InputDecoration(
          hintText: "Email",
          icon: Icon(Icons.email_outlined),
          border: InputBorder.none,
          hintStyle: textHint),
    );
  }

  void nextPage() {
    widget.model?.email = controllerEmail.text;
    print(widget.model?.parseAsJson());
    Helper.navigate(context, Password(model: widget.model));
  }
}
