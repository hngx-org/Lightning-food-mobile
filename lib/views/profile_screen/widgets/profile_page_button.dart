import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

class ProfilePageButton extends StatelessWidget {
  const ProfilePageButton({
    super.key,
    required this.leadingIcon,
    required this.buttonLabel,
    required this.buttonColor,
    this.isLogOut = false,
    required this.onTap,
  });

  final Icon leadingIcon;
  final String buttonLabel;
  final Color buttonColor;
  final VoidCallback onTap;
  final bool isLogOut;

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        isLogOut ? AppColor.errorColor : AppColor.plainBlack;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 72.h,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isLogOut ? Colors.transparent : buttonColor,
          border: Border.all(
            color: AppColor.plainBlack,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                leadingIcon,
                SizedBox(width: 8.w),
                Text(
                  buttonLabel,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: foregroundColor,
                  ),
                ),
              ],
            ),
            isLogOut
                ? const SizedBox()
                : const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                  ),
          ],
        ),
      ),
    );
  }
}
