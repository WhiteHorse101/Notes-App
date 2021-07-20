import 'package:flutter/material.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline5: base.headline5!.copyWith(
        fontFamily: 'Acumin-RPro',
        color: Color(0xffFFFFFF),
      ),
    );
  }

  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
  );
}
