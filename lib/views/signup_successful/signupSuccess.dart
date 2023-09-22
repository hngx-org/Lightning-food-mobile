// ignore_for_file: non_constant_identifier_names

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          backgroundColor: AppColor.pureWhite,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(24, 160, 24, 344),
            child: Container(
              width: 382.h,
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 68),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 318.w,
                      height: 180.h,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                              'images/vuesax-outline-tick-circle.svg'),
                          SizedBox(height: 32.w),
                          Text('Your Account has been created successfully',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    SizedBox(height: 64.h),
                    AppButton(
                        height: 48.h,
                        width: 332.w,
                        buttonText: 'Home',
                        onTap: null,
                        buttonColor: AppColor.primaryColor,
                        buttonTextColor: AppColor.pureWhite,
                        fontSize: 16.sp),
                  ],
                ),
              ),
            ),
          ),
        ),
        MyConfetti(controller: confettiController)
      ],
    );
  }
}
