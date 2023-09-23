import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      height: 56.h,
      // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: TextFormField(
        cursorColor: AppColor.plainBlack,
        style: TextStyle(fontSize: 14.sp),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
