import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

class EditProfileTextField extends StatelessWidget {
  const EditProfileTextField({
    super.key,
    required this.controller,
    required this.fieldLabel,
    required this.validator,
    this.enabled = true,
    this.hint,
  });

  final TextEditingController controller;
  final String fieldLabel;
  final String? Function(String?)? validator;
  final bool enabled;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    final hintText = hint ?? controller.text;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldLabel,
          style: TextStyle(
            fontSize: 16.sp,
            color: enabled ? AppColor.plainBlack : AppColor.black33,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          
          enabled: enabled,
          validator: validator != null
              ? (value) {
                  return validator!(value);
                }
              : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
