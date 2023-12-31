import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

import '../../constants/app_widgets.dart';
import 'dummy_data.dart';
import 'widgets/custom_profile_app_bar.dart';
import 'widgets/edit_profile_text_field.dart';
import 'widgets/profile_icon.dart';

//TODO: Probably change this to stateless when using state management
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController =
      TextEditingController(text: profileData['name']);
  TextEditingController displayNameController =
      TextEditingController(text: 'Maya');
  TextEditingController mailController = TextEditingController(
    text: profileData['email'],
  );
  TextEditingController idController = TextEditingController(
    text: profileData['id'],
  );
  TextEditingController organizationController =
      TextEditingController(text: profileData['id']);

  @override
  void dispose() {
    nameController.dispose();
    displayNameController.dispose();
    mailController.dispose();
    idController.dispose();
    organizationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: CustomProfileAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        title: 'Edit Profile',
      ).build(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10).copyWith(bottom: 16),
        child: Column(
          children: [
            ProfileIcon(
              isEditable: true,
              onTap: () {
                //TODO: Edit the user image
              },
            ),
            SizedBox(height: 32.h),
            EditProfileTextField(
              controller: nameController,
              fieldLabel: 'Name',
              validator: (input) {
                if (input != null && input.isNotEmpty) {
                  return null;
                } else {
                  return 'Name cannot be null';
                }
              },
            ),
            SizedBox(height: 12.h),
            EditProfileTextField(
              controller: displayNameController,
              fieldLabel: 'Display Name',
              validator: (input) {
                if (input != null && input.isNotEmpty) {
                  return null;
                } else {
                  return 'Display name cannot be null';
                }
              },
            ),
            SizedBox(height: 12.h),
            EditProfileTextField(
              controller: mailController,
              fieldLabel: 'Email',
              enabled: false,
              validator: null,
            ),
            SizedBox(height: 12.h),
            EditProfileTextField(
              controller: organizationController,
              fieldLabel: 'Organization Name',
              validator: null,
              enabled: false,
            ),
            SizedBox(height: 12.h),
            EditProfileTextField(
              controller: idController,
              fieldLabel: 'Staff Id',
              validator: null,
              enabled: false,
            ),
            SizedBox(height: 28.h),
            AppButton(
              buttonColor: AppColor.primaryColor,
              buttonText: 'Save',
              height: 60.h,
              fontSize: 16.sp,
              buttonTextColor: AppColor.white2,
              onTap: () {
                Navigator.of(context).pop();
                //TODO: Save to the controller
              },
              width: (MediaQuery.of(context).size.width),
            ),
          ],
        ),
      ),
    );
  }
}
