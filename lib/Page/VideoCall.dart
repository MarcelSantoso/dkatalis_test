import 'package:dkatalis_test/Helper/Constants.dart';
import 'package:dkatalis_test/Helper/Wgt.dart';
import 'package:flutter/material.dart';

class VideoCall extends StatefulWidget {
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: Wgt.appbar(title: "Create Account"),
      body: body(),
    );
  }

  Widget body() {
    return Container();
  }
}
