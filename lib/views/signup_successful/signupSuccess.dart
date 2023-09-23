// ignore_for_file: non_constant_identifier_names

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lightning_food_mobile/main.dart';
import 'package:lightning_food_mobile/views/signup_successful/reusable_confetti.dart';

class SignUpSuccessfulPage extends StatefulWidget {
  const SignUpSuccessfulPage({super.key});

  @override
  State<SignUpSuccessfulPage> createState() => _SignUpSuccessfulPageState();
}

class _SignUpSuccessfulPageState extends State<SignUpSuccessfulPage> {
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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyConfetti(controller: confettiController),
          SizedBox(
            height: 160.h,
          ),
          Container(
            margin: EdgeInsets.only(top: 0,bottom: 344.h,left: 24.w,right: 24.w),
            height: 428.h,
            width: 382.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColor.secondaryColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 68.h,
                ),
                SvgPicture.asset('images/vuesax-outline-tick-circle.svg'),
                SizedBox(height: 32.h),
                Text('Your Account has been created \nsuccessfully',
                    textAlign: TextAlign.center,
                    style: TextStyle( fontSize: 14.sp, fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 64.h,
                ),
                AppButton(
                    height: 48.h,
                    width: 322.w,
                    buttonText: "Home",
                    buttonTextColor: AppColor.pureWhite,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Home()));
                    },
                    buttonColor: AppColor.primaryColor,
                    fontSize: 16.sp),

              ],
            ),
          )
        ],
      ),
    );
  }
}