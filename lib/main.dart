import 'package:flutter/material.dart';
import 'package:notes_app/Screens/Welcome/signup.dart';
import 'package:notes_app/constants.dart';
import './theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: basicTheme(),
      home: Signup(),
    );
  }
}
