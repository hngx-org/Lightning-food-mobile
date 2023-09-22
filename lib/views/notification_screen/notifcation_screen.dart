import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 66.h,
            // ),
            Container(
              margin: EdgeInsets.only(top: 66.h),
              child: Row(
                children: [
                  IconButton(
                      onPressed:(){Navigator.pop(context);},
                      icon: Icon(Iconsax.arrow_left)),
                  SizedBox(
                    width: 108.w,
                  ),
                  Text(
                    "Notification",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: AppColor.black2),
                  ),
                  SizedBox(
                    width: 128.w,
                  )
                ],
              ),
            ),
            SizedBox(height: 27.h),
            Container(
                margin: EdgeInsets.only(left: 24.w),
                child: Text(
                  "New",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: ContactListView(
                    profilePath: "images/lady.jpeg",
                    listNumber: 1,
                    tileTitle: "Joy Lu sent a free lunch",
                    time: "1h",
                    icon: Iconsax.coin5,
                    onTap: () {},
                    containerHeight: 64.h),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24.w),
              child: Text(
                "Older",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: ContactListView(
                    profilePath: "images/lady.jpeg",
                    listNumber: 5,
                    tileTitle: "Joy Lu sent a free lunch",
                    time: "1h",
                    icon: Iconsax.coin5,
                    onTap: () {},
                    containerHeight: 64.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
