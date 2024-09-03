import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NextButton extends StatelessWidget {
  const NextButton({super.key,required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: 70.w,
      child: CircleAvatar(
          radius: 35.r,
          backgroundColor: const Color(0xff20473E),
          child: IconButton (onPressed:onPressed,
            icon: Icon(Icons.arrow_forward,size: 30.sp,color: Colors.white,),
          )),
    );
  }
}
