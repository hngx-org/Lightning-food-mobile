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
  const ContactListView(
      {Key? key,
      required this.profilePath,
      required this.listNumber,
      required this.tileTitle,
      required this.onTap,
      required this.containerHeight,
      this.time,
      required this.iconImage,
      this.physics,
      this.icon})
      : super(key: key);

  final String profilePath;
  final String? time;
  final dynamic physics;
  final IconData? icon;
  final bool iconImage;
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
    List<String> imageIcon = [
      'images/heart.png',
      'images/icon.png',
    ];

    return ListView.separated(
      itemCount: listNumber,
      physics: physics,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, child) {
        return SizedBox(
          height: 16.h,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return _listTile(
          color[index % color.length],
          imageIcon[index % imageIcon.length],
          iconImage,
        );
      },
    );
  }

  Widget _listTile(Color conColor, String image, bool isVisible) {
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
                  image: AssetImage(profilePath),
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
            dialogIcon,
            SizedBox(
              height: 32.h,
            ),
            dialogText,
            SizedBox(
              height: 64.h,
            ),
            dialogButton
          ],
        ),
      ),
    );
  }
}
