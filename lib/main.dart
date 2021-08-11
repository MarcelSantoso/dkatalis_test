import 'package:flutter/material.dart';

import 'Model/Data.dart';
import 'Page/Home.dart';

Data model = Data();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(model: model),
    );
  }
}
