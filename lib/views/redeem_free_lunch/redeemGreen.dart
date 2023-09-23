// ignore_for_file: sized_box_for_whitespace, deprecated_member_use, non_constant_identifier_names

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/views/redeem_free_lunch/cashGreen.dart';
import 'package:lightning_food_mobile/views/signup_successful/reusable_confetti.dart';

class RedeemScreen extends StatefulWidget {
  const RedeemScreen({super.key});

  @override
  State<RedeemScreen> createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
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

  Widget SizedBoxH(double h) {
    return SizedBox(
      height: h.h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Left Arrow
            MyConfetti(controller: confettiController),
            Container(
              alignment: const Alignment(-1.0, -1.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Iconsax.arrow_left,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBoxH(13.0),
            //
            Container(
              width: 382.w,
              height: 60.h,
              child: Text(
                'Joy Lu sent you a free lunch with a\nnote',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ),
            SizedBoxH(8.h),
            Container(
              height: 40.h,
              width: 40.w,
              child: Image.asset(
                'images/celebrate_icon.png',
                fit: BoxFit.contain,
              ),
            ),
            //
            SizedBoxH(15.0),
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
              width: 382.w,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              height: 122.h,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 2.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(24),
                color: AppColor.secondaryColor,
              ),
              child: Center(
                child: Text(
                  "\"Hello Maya, I am gifting you a free lunch for giving "
                      "such a stellar presentation today. Well done!\"",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    fontFamily: 'Poppins',
                    height: 1
                  ),
                ),
              ),
            ),
            Expanded(flex: 2, child: SizedBoxH(40.0)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.h),
              child: AppButton(
                  height: 48.h,
                  width: 382.w,
                  buttonText: "Redeem Free Lunch for Cash",
                  buttonTextColor: Colors.white,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CashGreenScreen()));
                  },
                  buttonColor: AppColor.primaryColor,
                  fontSize: 16.sp),
            ),
            Expanded(flex: 4, child: SizedBoxH(60.0))
          ],
        ),
      ),
    );
  }
}
