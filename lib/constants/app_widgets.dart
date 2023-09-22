import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.height,
    required this.width,
    required this.buttonText,
    required this.buttonTextColor,
    required this.onTap,
    required this.buttonColor,
    required this.fontSize,
  }) : super(key: key);

  final double height;
  final double width;
  final String buttonText;
  final Color buttonTextColor;
  final Function()? onTap;
  final Color buttonColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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

class ContactListView extends StatelessWidget {
  ContactListView(
      {Key? key,
      required this.profilePath,
      required this.listNumber,
      required this.tileTitle,
      required this.onTap,
      required this.containerHeight,
      this.time,
      this.icon})
      : super(key: key);

  final String profilePath;
  final String? time;
  final IconData? icon;
  final double containerHeight;
  final int listNumber;
  final String tileTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    List<Color> color = [
      AppColor.secondaryColor,
      AppColor.tetiaryColor,
    ];
    return ListView.separated(
      itemCount: listNumber,
      separatorBuilder: (BuildContext context, child) {
        return SizedBox(
          height: 16.h,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return _listTile(
          color[index % color.length],
        );
      },
    );
  }

  Widget _listTile(Color conColor) {
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
              height: 55.h,
              width: 62.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2.w),
                image: DecorationImage(
                  image: AssetImage(profilePath),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            SizedBox(
              width: 12.h,
            ),
            Text(
              tileTitle,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Text(time??''),
            SizedBox(
              width: 13.w,
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}

class DialogueBox extends StatelessWidget {
  const DialogueBox(
      {Key? key,
      required this.dialogIcon,
      required this.dialogText,
      required this.dialogButton})
      : super(key: key);

  final Widget dialogIcon, dialogText, dialogButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        height: 428,
        width: 380,
        decoration: BoxDecoration(color: AppColor.secondaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dialogIcon,
            const SizedBox(
              height: 32,
            ),
            dialogText,
            const SizedBox(
              height: 64,
            ),
            dialogButton
          ],
        ),
      ),
    );
  }
}
