import 'package:dkatalis_test/Helper/Constants.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  int activePos = 0;
  int totalPage = 4;
  PageIndicator({this.activePos = 0});

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    List<Widget> arrWidget = [];
    for (var i = 1; i <= widget.totalPage; i++) {
      // Draw divider
      if (arrWidget.isNotEmpty) arrWidget.add(divider());
      // Draw indicator
      arrWidget.add(indicator(i));
    }
    return Container(
        child: Row(children: arrWidget));
  }

  Widget divider() {
    return Expanded(child: Container(height: 3, color: colorIndicatorDivider));
  }

  Widget indicator(i) {
    return Container(
        height: page_indicator,
        width: page_indicator,
        decoration: BoxDecoration(
            color:
                i <= widget.activePos ? colorIndicator : colorIndicatorInactive,
            borderRadius: BorderRadius.circular(page_indicator),
            border: Border.all(color: Colors.white, width: 2)),
        child: FittedBox(
            child: Padding(
                padding: const EdgeInsets.all(padding_xs),
                child: Text("$i",
                    style: i <= widget.activePos
                        ? textIndicator
                        : textIndicatorInactive))));
  }
}
