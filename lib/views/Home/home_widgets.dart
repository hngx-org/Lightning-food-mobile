import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecentFreeLunchView extends StatelessWidget {
  const RecentFreeLunchView(
      {this.icon,
      required this.iconColor,
      required this.containerHeight,
      required this.tileTitle,
      required this.onTap,
      super.key});

  final Widget? icon;
  final Color iconColor;
  final double containerHeight;
  final String tileTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    List<String> iconArrow = [
      'images/arrow-up_red.svg',
      'images/arrow-up_green.svg',
    ];
    return SizedBox(
      height: containerHeight,
      child: ListView.builder(
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: SvgPicture.asset(iconArrow[index % iconArrow.length]),
              title: Text(
                tileTitle,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
              ),
              onTap: onTap,
              trailing: Text(
                '1h',
                style: TextStyle(fontSize: 11.sp),
              ),
            );
          }),
    );
  }
}
