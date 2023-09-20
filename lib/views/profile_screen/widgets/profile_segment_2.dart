import 'package:flutter/material.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

import 'profile_page_button.dart';
import '../edit_profile_screen.dart';

class ProfileSegment2 extends StatelessWidget {
  const ProfileSegment2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ProfilePageButton(
            leadingIcon: const Icon(
              Icons.edit,
            ),
            buttonLabel: 'Edit Profile Information',
            buttonColor: AppColor.secondaryColor,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          ProfilePageButton(
            leadingIcon: const Icon(
              Icons.settings_outlined,
            ),
            buttonLabel: 'Settings',
            buttonColor: AppColor.tetiaryColor,
            onTap: () {},
          ),
          const SizedBox(height: 8),
          ProfilePageButton(
            leadingIcon: const Icon(
              Icons.live_help_outlined,
            ),
            buttonLabel: 'Help & Support',
            buttonColor: AppColor.secondaryColor,
            onTap: () {},
          ),
          const SizedBox(height: 8),
          ProfilePageButton(
            leadingIcon: const Icon(
              Icons.info_outline,
            ),
            buttonLabel: 'About',
            buttonColor: AppColor.tetiaryColor,
            onTap: () {},
          ),
          const SizedBox(height: 16),
          ProfilePageButton(
            leadingIcon: Icon(
              Icons.info_outline,
              color: Colors.red.shade800,
            ),
            buttonLabel: 'About',
            buttonColor: AppColor.secondaryColor,
            onTap: () {},
            isLogOut: true,
          ),
        ],
      ),
    );
  }
}
