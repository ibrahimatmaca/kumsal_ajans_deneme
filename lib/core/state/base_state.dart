import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);

  // ignore: type_annotate_public_apis
  SizedBox emptyBoxHeight(double? height) => SizedBox(height: height);
  SizedBox emptyBoxWidth(double? width) => SizedBox(width: width);
}
