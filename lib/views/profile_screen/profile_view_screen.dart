import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

import 'widgets/custom_profile_app_bar.dart';
import 'widgets/profile_segment.dart';
import 'widgets/profile_segment_2.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: const CustomProfileAppBar(
        title: 'Profile',
      ).build(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10).copyWith(bottom: 16),
        child: Column(
          children: [
            const ProfileSegment(),
            SizedBox(height: 12.h),
            const ProfileSegment2(),
          ],
        ),
      ),
    );
  }
}
