import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginMethodsWidget extends StatelessWidget {
  final String svg;
  const LoginMethodsWidget({
    super.key,
    required this.svg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(6),
      child: SizedBox(
        child: SvgPicture.asset(svg),
      ),
    );
  }
}
