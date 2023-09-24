import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/view_models/user_data_provider.dart';
import 'package:lightning_food_mobile/views/login_view/login_screen.dart';

import '../edit_profile_screen.dart';
import 'package:lightning_food_mobile/views/profile_screen/staff_invite_screen/staff_invite_screen.dart';

import 'profile_page_button.dart';

//TODO: Change to stateless widget when plugged to the controller
class ProfileSegment2 extends ConsumerStatefulWidget {
  const ProfileSegment2({
    super.key,
  });

  @override
  ConsumerState<ProfileSegment2> createState() => _ProfileSegment2State();
}

class _ProfileSegment2State extends ConsumerState<ProfileSegment2> {
  @override
  Widget build(BuildContext context) {
    final homeUserDetails = ref.watch(userDataProvider);
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            ProfilePageButton(
              leadingIcon: const Icon(
                Iconsax.message_edit,
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
            homeUserDetails.loginData.user.isAdmin
                ? Column(
                    children: [
                      SizedBox(height: 8.h),
                      ProfilePageButton(
                        leadingIcon: const Icon(
                          Iconsax.message_edit,
                        ),
                        buttonLabel: 'Invite User',
                        buttonColor: AppColor.secondaryColor,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const StaffInviteScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                : const SizedBox(height: 0),
            SizedBox(height: 8.h),
            ProfilePageButton(
              leadingIcon: const Icon(
                Iconsax.setting_2,
              ),
              buttonLabel: 'Settings',
              buttonColor: AppColor.tetiaryColor,
              onTap: () {},
            ),
            SizedBox(height: 8.h),
            ProfilePageButton(
              leadingIcon: const Icon(
                Iconsax.message_question,
              ),
              buttonLabel: 'Help & Support',
              buttonColor: AppColor.secondaryColor,
              onTap: () {},
            ),
            SizedBox(height: 8.h),
            ProfilePageButton(
              leadingIcon: const Icon(
                Iconsax.info_circle,
              ),
              buttonLabel: 'About',
              buttonColor: AppColor.tetiaryColor,
              onTap: () {},
            ),
            SizedBox(height: 32.h),
            ProfilePageButton(
              leadingIcon: Icon(
                Iconsax.logout,
                color: AppColor.errorColor,
              ),
              buttonLabel: 'Logout',
              buttonColor: AppColor.secondaryColor,
              onTap: () {
                homeUserDetails.logoutUser();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              isLogOut: true,
            ),
          ],
        ),
      ),
    );
  }
}
