import 'package:flutter/material.dart';
import './screens/authen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master Firebase',
      home: Authen(),
    );
  }
}