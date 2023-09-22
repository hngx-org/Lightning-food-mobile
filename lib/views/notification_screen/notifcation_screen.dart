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
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        centerTitle: true,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Iconsax.arrow_left,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Notification',
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Container(
                margin: EdgeInsets.only(left: 24.w),
                child: Text(
                  "New",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: ContactListView(
                    profilePath: "images/lady.jpeg",
                    physics: const NeverScrollableScrollPhysics(),
                    listNumber: 1,
                    tileTitle: "Joy Lu sent a free lunch",
                    time: "1h",
                    icon: Iconsax.coin5,
                    onTap: () {},
                    containerHeight: 64.h),
              ),
              SizedBox(
                height: 20.h,
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
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: ContactListView(
                    profilePath: "images/lady.jpeg",
                    physics: const NeverScrollableScrollPhysics(),
                    listNumber: 5,
                    tileTitle: "Joy Lu sent a free lunch",
                    time: "1h",
                    icon: Iconsax.coin5,
                    onTap: () {},
                    containerHeight: 64.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
