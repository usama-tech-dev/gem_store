import 'package:flutter/material.dart';

class Navigate {
  static to(BuildContext context, Widget widget) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => widget,
    ));
  }

  static Future toReplacement(BuildContext context, Widget widget) async {
    await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => widget));
  }

  static Future toReplacementAll(BuildContext context, Widget widget) async {
    await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => widget), (route) => false);
  }
}
