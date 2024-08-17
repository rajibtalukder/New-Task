import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';

Widget customButton(String text,
    {Function()? onPressed,
    bool brdr = false,
    double? height,
    double? width,
    double? textSize,
    color = black,
    textColor = white,
    FontWeight? fontW}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
        height: height ?? 56.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color,
          border: brdr ? Border.all(color: black, width: 1) : null,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(fontSize: textSize ?? 18,
                  fontWeight: fontW ?? FontWeight.w400,
                  color: textColor)
              ),
        )),
  );
}
