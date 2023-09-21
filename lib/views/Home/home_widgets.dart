import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentFreeLunchView extends StatelessWidget {
  const RecentFreeLunchView(
      {required this.icon,
      required this.iconColor,
      required this.containerHeight,
      required this.tileTitle,
      required this.onTap,
      super.key});

  final Widget icon;
  final Color iconColor;
  final double containerHeight;
  final String tileTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      child: ListView.builder(
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child: ListTile(
              leading: Transform.rotate(angle: 150, child: icon),
              title: Text(
                tileTitle,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
              ),
              onTap: onTap,
              trailing: Text(
                '1h',
                style: TextStyle(fontSize: 11.sp),
              ),
            ));
          }),
    );
  }
}
