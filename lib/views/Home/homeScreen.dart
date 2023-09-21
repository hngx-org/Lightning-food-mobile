import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/views/Home/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20, right: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('images/lady.jpeg'),
                    radius: 20,
                  ),
                  title: Text(
                    'Hello, Maya!',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Iconsax.notification_bing5),
                ),
                const SizedBox(height: 12),
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 280,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.plainBlack,
                          offset: const Offset(5.0, 5.0),
                        )
                      ],
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Text("You have",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("7",
                          style: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.w900)),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      Image(
                        image: AssetImage("images/coins.png"),
                        width: 100,
                      ),

                      const Text("Free Lunches",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppButton(
                            buttonTextColor: AppColor.pureWhite,
                            height: 50,
                            width: 150,
                            buttonText: 'Redeem Free Lunch',
                            onTap: null,
                            buttonColor: AppColor.primaryColor,
                          ),
                          SizedBox(
                            width: 8.h,
                          ),
                          AppButton(
                            buttonTextColor: AppColor.primaryColor,
                            height: 50,
                            width: 150,
                            buttonText: 'Send Free Lunch',
                            onTap: null,
                            buttonColor: AppColor.pureWhite,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " Recent Free Lunch",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 400,
                  decoration: BoxDecoration(
                      color: AppColor.tetiaryColor,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(width: 1.h, color: AppColor.black33)),
                  child: RecentFreeLunchView(
                    icon: Icon(Iconsax.arrow_square_down4),
                    iconColor: Colors.green,
                    containerHeight: 50.h,
                    tileTitle: 'Joy Lu sent a free lunch',
                    onTap: null,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}