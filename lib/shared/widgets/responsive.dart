import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictactoe_test/core/utils/utils.dart';

/// Permet de créer un padding horizontal responsive
EdgeInsetsGeometry pw(double value) =>
    execInCaseOfPlatfom<EdgeInsetsGeometry>(() => EdgeInsets.symmetric(horizontal: value), () => EdgeInsets.symmetric(horizontal: value.w));

/// Permet de créer un padding vertical responsive
EdgeInsetsGeometry ph(double value) =>
    execInCaseOfPlatfom<EdgeInsetsGeometry>(() => EdgeInsets.symmetric(vertical: value), () => EdgeInsets.symmetric(vertical: value.h));

/// Permet de créer une SizedBox responsive en [height]
Widget sh(double value) => SizedBox(height: execInCaseOfPlatfom<double>(() => value, () => value.h));

/// Permet de créer une SizedBox responsive en [width]
Widget sw(double value) => SizedBox(width: execInCaseOfPlatfom<double>(() => value, () => value.w));

/// Permet de créer un padding horizontal et vertical responsive
EdgeInsetsGeometry pwh(double width, double height) => execInCaseOfPlatfom<EdgeInsetsGeometry>(
  () => EdgeInsets.symmetric(horizontal: width, vertical: height),
  () => EdgeInsets.symmetric(horizontal: width.w, vertical: height.h),
);

/// Permet de récupérer une [fontSize] en responsive
double sp(double value) => execInCaseOfPlatfom<double>(() => value, () => value.sp);

/// Permet de récupérer un [radius] en responsive
double r(double value) => execInCaseOfPlatfom<double>(() => value, () => value.r);

/// Permet de récupérer une [height] en responsive
double formatHeight(double value) => execInCaseOfPlatfom<double>(() => value, () => value.h);

/// Permet de récupérer une [width] en responsive
double formatWidth(double value) => execInCaseOfPlatfom<double>(() => value, () => value.w);

EdgeInsetsGeometry defaultPagePadding(MediaQueryData mediaQuery) => EdgeInsets.only(
  top: mediaQuery.padding.top + formatHeight(12) + (Platform.isAndroid ? formatHeight(6) : 0),
  bottom: mediaQuery.padding.bottom + formatHeight(15),
);

EdgeInsetsGeometry defaultPageBottomPadding(MediaQueryData mediaQuery) => EdgeInsets.only(bottom: mediaQuery.padding.bottom + formatHeight(15));

EdgeInsetsGeometry defaultPageTopPadding(MediaQueryData mediaQuery) =>
    EdgeInsets.only(top: mediaQuery.padding.top + formatHeight(12) + (Platform.isAndroid ? formatHeight(6) : 0));
