import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class SetBackground extends StatelessWidget {
  final Widget? child;

  const SetBackground({Key? key, @required this.child}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: Svg("assets/background1.svg"), fit: BoxFit.cover)),
        child: child!);
  }
}
