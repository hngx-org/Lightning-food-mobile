// ignore_for_file: sized_box_for_whitespace, deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/views/redeem_free_lunch/cashGreen.dart';

class RedeemScreen extends StatelessWidget {
  const RedeemScreen({super.key});

  Widget SizedBoxH(double h) {
    return SizedBox(
      height: h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Left Arrow
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
              width: 382,
              height: 60,
              child: Text(
                'Joy Lu sent you a free lunch with\n a note',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ),
            //
            SizedBoxH(15.0),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              width: 382,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              height: 122,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 2.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(24),
                color: const Color.fromRGBO(255, 219, 88, 1),
              ),
              child: Center(
                child: Text(
                  "\"Hello Maya, I am gifting you a free lunch for giving such a stellar presentation today. Well done!\"",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Expanded(flex: 2, child: SizedBoxH(40.0)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AppButton(
                  height: 48,
                  width: 382,
                  buttonText: "Redeem Free Lunch for Cash",
                  buttonTextColor: Colors.white,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CashGreenScreen()));
                  },
                  buttonColor: AppColor.primaryColor,
                  fontSize: 16),
            ),
            Expanded(flex: 4, child: SizedBoxH(60.0))
          ],
        ),
      ),
    );
  }
}
