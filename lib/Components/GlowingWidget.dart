import 'dart:math';

import 'package:dkatalis_test/Helper/Constants.dart';
import 'package:flutter/material.dart';

class GlowingWidget extends StatefulWidget {
  Widget? child;
  GlowingWidget({this.child});
  _GlowingWidget createState() => _GlowingWidget();
}

class _GlowingWidget extends State<GlowingWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController?.repeat(reverse: true);
    _animation = Tween(begin: 50.0, end: 70.0).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _animation?.value,
      height: _animation?.value,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.5),
      ),
      child: Center(
        child: Container(
          width: 50,
          height: 50,
          child: widget.child,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController?.stop();
    _animation?.removeListener(() {});
    _animationController = null;
    super.dispose();
  }
}
