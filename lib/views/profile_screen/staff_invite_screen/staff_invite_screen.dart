import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/views/profile_screen/widgets/custom_profile_app_bar.dart';
import 'package:lightning_food_mobile/views/profile_screen/widgets/edit_profile_text_field.dart';

class StaffInviteScreen extends StatelessWidget {
  const StaffInviteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: const CustomProfileAppBar(title: 'Invite a Staff').build(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Staff Invite',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Enter staff\'s email for invite',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColor.black33,
              ),
            ),
            SizedBox(height: 20.h),
            EditProfileTextField(
              controller: mailController,
              fieldLabel: 'Email Address',
              hint: 'e.g kayjoy@gmail.com',
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'mail field cannot be empty';
                }
              },
            ),
            SizedBox(height: 50.h),
            AppButton(
              height: 60.h,
              width: MediaQuery.of(context).size.width,
              buttonText: 'Invite',
              buttonTextColor: AppColor.pureWhite,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Container(
                    padding: const EdgeInsets.all(10),
                    child: DialogueBox(
                      dialogIcon: Icon(Icons.abc),
                      dialogText: Text(
                        'Invite Email has been successfully sent',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      dialogButton: AppButton(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          buttonText: 'Continue',
                          buttonTextColor: AppColor.pureWhite,
                          onTap: () {},
                          buttonColor: AppColor.primaryColor,
                          fontSize: 16.sp),
                    ),
                  ),
                );
              },
              buttonColor: AppColor.primaryColor,
              fontSize: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
