import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/views/signup_successful/reusable_confetti.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.height,
    required this.width,
    required this.buttonText,
    required this.buttonTextColor,
    required this.onTap,
    this.margin,
    required this.buttonColor,
    required this.fontSize,
  }) : super(key: key);

  final double height;
  final double width;
  final String buttonText;
  final Color buttonTextColor;
  final Function()? onTap;
  final Color buttonColor;
  final dynamic margin;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColor.plainBlack,
              offset: const Offset(6, 4),
            )
          ]),
      child: InkWell(
        onTap: onTap,
        child: Center(
            child: Text(
          buttonText,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: buttonTextColor,
              fontSize: fontSize),
        )),
      ),
    );
  }
}

class CustomContactsListTile extends StatelessWidget {
  const CustomContactsListTile({
    super.key,
    required this.onTap,
    required this.containerHeight,
    required this.profilePath,
    required this.tileTitle,
    required this.time,
    required this.conColor,
    required this.image,
    required this.isVisible,
  });

  final Function()? onTap;
  final double containerHeight;
  final String profilePath;
  final String tileTitle;
  final String? time;
  final Color conColor;
  final String image;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: containerHeight,
        width: 382.w,
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: conColor,
          border: Border.all(width: 2.h, color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 5.w,
            ),
            Container(
              height: 45.h,
              width: 62.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2.w),
                image: DecorationImage(
                  image: NetworkImage(profilePath),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            SizedBox(
              width: 12.h,
            ),
            SizedBox(
              width: 220.w,
              child: Text(
                tileTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            Text(time ?? ''),
            SizedBox(
              width: 13.w,
            ),
            Visibility(
              visible: isVisible,
              child: Image.asset(
                height: 24.h,
                width: 24.w,
                image,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
      ),
    );
  }
}

class DialogueBox extends StatefulWidget {
  const DialogueBox(
      {Key? key,
      required this.dialogIcon,
      required this.dialogText,
      required this.dialogButton})
      : super(key: key);

  final Widget dialogIcon, dialogText, dialogButton;

  @override
  State<DialogueBox> createState() => _DialogueBoxState();
}

class _DialogueBoxState extends State<DialogueBox> {
  final dynamic confettiController = ConfettiController();

  @override
  void initState() {
    super.initState();
    confettiController.play();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      insetPadding: EdgeInsets.zero,
      child: Container(
        height: 428.h,
        width: 380.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColor.secondaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyConfetti(controller: confettiController),
            widget.dialogIcon,
            SizedBox(
              height: 32.h,
            ),
            widget.dialogText,
            SizedBox(
              height: 64.h,
            ),
            widget.dialogButton
          ],
        ),
      ),
    );
  }
}
