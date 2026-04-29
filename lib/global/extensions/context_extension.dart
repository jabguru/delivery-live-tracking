import 'package:delivery_live_tracking/global/widgets/space.dart' as space;
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get screenSize => MediaQuery.sizeOf(this);

  double eqH(double height) => space.eqH(this, height);

  double eqW(double width) => space.eqW(this, width);

  double eqR(double radius) => space.eqR(this, radius);

  double get bottomViewInset => MediaQuery.viewInsetsOf(this).bottom;

  double get bottomPadding => MediaQuery.paddingOf(this).bottom;

  double get topPadding => MediaQuery.paddingOf(this).top;

  double get fullBottomSheetHeight => screenSize.height * 0.8;

  double get topSpaceHeight => kToolbarHeight + topPadding;

  double scaledHeight(double height) {
    final textScaleFactor = MediaQuery.textScalerOf(this).scale(1.0);
    final scaledHeight = (height * textScaleFactor.clamp(1.0, 1.3));
    return scaledHeight;
  }
}
