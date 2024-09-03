import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIndicator extends StatelessWidget {
  final int currentIndex;
  final int length;
  final MainAxisAlignment? mainAxisAlignment;
  final double width;
  final double height;

  const CustomIndicator(
      {super.key,
      required this.currentIndex,
      required this.length,
      this.mainAxisAlignment,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          width: width.r,
          height: height.r,
          decoration: BoxDecoration(
            color: index == currentIndex
                ? const Color(0xffF04C29)
                : const Color(
                    0xffF04C29,
                  ).withOpacity(.5),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
