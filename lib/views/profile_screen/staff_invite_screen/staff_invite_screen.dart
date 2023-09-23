import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/views/profile_screen/widgets/custom_profile_app_bar.dart';
import 'package:lightning_food_mobile/views/profile_screen/widgets/edit_profile_text_field.dart';

class StaffInviteScreen extends StatefulWidget {
  const StaffInviteScreen({super.key});

  @override
  State<StaffInviteScreen> createState() => _StaffInviteScreenState();
}

class _StaffInviteScreenState extends State<StaffInviteScreen> {
  FocusNode textFieldFocusNode = FocusNode();

  @override
  void dispose() {
    textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: CustomProfileAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        title: 'Invite a Staff',
      ).build(context),
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
            SizedBox(height: 16.h),
            Text(
              'Enter staff\'s email for invite',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColor.black33,
              ),
            ),
            SizedBox(height: 22.h),
            EditProfileTextField(
              focusNode: textFieldFocusNode,
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
            SizedBox(height: 96.h),
            AppButton(
              height: 60.h,
              width: MediaQuery.of(context).size.width,
              buttonText: 'Invite',
              buttonTextColor: AppColor.pureWhite,
              buttonColor: AppColor.primaryColor,
              fontSize: 16.sp,
              onTap: () async {
                textFieldFocusNode.unfocus();
                //TODO: Send request to the controller
                //TODO: If the result is successful, show the dialog
                await showDialog(
                  context: context,
                  builder: (_) => DialogueBox(
                    dialogIcon: SvgPicture.asset(
                      'images/vuesax-outline-tick-circle.svg',
                    ),
                    dialogText: Text(
                      'Invite has been successfully sent ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14.sp),
                    ),
                    dialogButton: AppButton(
                      margin: EdgeInsets.symmetric(horizontal: 24.w),
                      height: 48.h,
                      width: 383.w,
                      buttonText: 'Continue',
                      buttonTextColor: Colors.white,
                      buttonColor: AppColor.primaryColor,
                      fontSize: 14.sp,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                );
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
