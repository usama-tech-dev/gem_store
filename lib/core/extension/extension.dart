import 'package:flutter/material.dart';

extension MyBuildContext on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;

}
