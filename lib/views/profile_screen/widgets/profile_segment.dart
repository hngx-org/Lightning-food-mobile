import 'package:flutter/material.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

import '../dummy_data.dart';
import 'profile_icon.dart';

class ProfileSegment extends StatelessWidget {
  const ProfileSegment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      // width: MediaQuery.of(context).size.width / 2,
      // constraints: const BoxConstraints(
      //   maxWidth: 160,
      //   maxHeight: 169,
      //   minHeight: 120,
      //   minWidth: 120,
      // ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.plainBlack,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const ProfileIcon(isEditable: false,),
          const SizedBox(height: 12),
          Text(
            profileData['name']!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            profileData['email']!,
            style:  TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColor.lightBlack,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            profileData['id']!,
          )
        ],
      ),
    );
  }
}
