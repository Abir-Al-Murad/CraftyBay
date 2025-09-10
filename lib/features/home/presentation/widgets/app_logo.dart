import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.width
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/logo.svg',width: width??120,);
  }
}
