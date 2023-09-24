import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/view_models/user_data_provider.dart';
import 'package:lightning_food_mobile/views/Home/home_widgets.dart';
import 'package:lightning_food_mobile/views/notification_screen/notifcation_screen.dart';
import 'package:lightning_food_mobile/views/profile_screen/edit_profile_screen.dart';
import 'package:lightning_food_mobile/views/redeem_free_lunch/redeemGreen.dart';
import 'package:lightning_food_mobile/views/send_free_lunch/send_free_lunch_screen.dart';



class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeUserDetails = ref.watch(userDataProvider);
    homeUserDetails.getLunchHistory();
    homeUserDetails.getWithdrawalHistory();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20, right: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const EditProfileScreen()));
                    },
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColor.plainBlack,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('images/lady.jpeg'),
                        radius: 20,
                      ),
                    ),
                  ),
                  title: Row(
                    children: [
                      Text(
                        'Hello, ${homeUserDetails.loginData.user.isAdmin == true? "Admin": homeUserDetails.loginData.user.firstName} ',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        'images/star.png',
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const NotificationScreen()));
                    },
                    icon: const Icon(
                      Iconsax.notification_bing5,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: 382.w,
                  height: 300.h,
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
                        height: 16.h,
                      ),
                      Text("You have",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text("${homeUserDetails.loginData.user.lunchCreditBalance}",
                          style: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.w900)),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      Image(
                        image: const AssetImage("images/coins.png"),
                        width: 100.w,
                        height: 46.h,
                      ),
                      SizedBox(height: 8.h,),
                      Text("Free Lunches",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppButton(
                            buttonTextColor: AppColor.pureWhite,
                            height: 45.h,
                            width: 157.w,
                            buttonText: 'Redeem Free Lunch',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const RedeemScreen()));
                            },
                            buttonColor: AppColor.primaryColor,
                            fontSize: 14.sp,
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          AppButton(
                            buttonTextColor: AppColor.primaryColor,
                            height: 45.h,
                            width: 157.w,
                            buttonText: 'Send Free Lunch',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SendFreeLunch(),
                                ),
                              );
                            },
                            buttonColor: AppColor.pureWhite,
                            fontSize: 14.sp,
                          ),
                          SizedBox(height: 20.h,),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22.71.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " Recent Free Lunch",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 400.h,
                  decoration: BoxDecoration(
                    color: AppColor.tetiaryColor,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(width: 1.h, color: AppColor.black33),
                  ),
                  child: RecentFreeLunchView(
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
