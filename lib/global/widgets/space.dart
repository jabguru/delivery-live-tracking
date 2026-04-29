import 'dart:math';

import 'package:delivery_live_tracking/global/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

double eqH(BuildContext context, double height) {
  double heightInDesign = 926.0;
  double screenHeight = context.screenSize.height;
  return (height / heightInDesign) * screenHeight;
}

double eqW(BuildContext context, double width) {
  double widthInDesign = 428.0;
  double screenWidth = context.screenSize.width;
  return (width / widthInDesign) * screenWidth;
}

double eqR(BuildContext context, double radius) {
  return min(eqW(context, radius), eqH(context, radius));
}
