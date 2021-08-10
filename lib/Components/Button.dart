import 'package:dkatalis_test/Helper/Constants.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  String text = "";
  Color backgroundColor, textColor;
  var handler;
  Button({
    this.text = "",
    this.handler,
    this.backgroundColor = colorPrimary,
    this.textColor = colorLight,
  });
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            )),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: padding_15)),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return widget.backgroundColor.withOpacity(0.5);
              }
              return widget.backgroundColor;
            }),
          ),
          onPressed: widget.handler,
          child: Text('${widget.text}',
              style: TextStyle(
                color: widget.textColor,
                fontWeight: FontWeight.w600,
              ))),
    );
  }
}
