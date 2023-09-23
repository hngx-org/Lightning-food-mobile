import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

class EditProfileTextField extends StatefulWidget {
  const EditProfileTextField({
    super.key,
    required this.controller,
    required this.fieldLabel,
    required this.validator,
    this.focusNode,
    this.enabled = true,
    this.hint,
  });

  final TextEditingController controller;
  final String fieldLabel;
  final String? Function(String?)? validator;
  final bool enabled;
  final String? hint;
  final FocusNode? focusNode;

  @override
  State<EditProfileTextField> createState() => _EditProfileTextFieldState();
}

class _EditProfileTextFieldState extends State<EditProfileTextField> {
  late String hintText;
  @override
  void initState() {
    hintText = widget.hint ?? widget.controller.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldLabel,
          style: TextStyle(
            fontSize: 16.sp,
            color: widget.enabled ? AppColor.plainBlack : AppColor.black33,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.plainBlack),
            borderRadius: BorderRadius.circular(8.r),
          ),
          height: 56.h,
          child: TextField(
            focusNode: widget.focusNode,
            enabled: widget.enabled,
            // validator: validator != null
            //     ? (value) {
            //         return validator!(value);
            //       }
            //     : null,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 12.sp),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8.r),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
