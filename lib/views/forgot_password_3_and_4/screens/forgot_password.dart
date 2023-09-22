import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

import '../../../constants/app_widgets.dart';
import '../widgets/text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _showSuccessDialog = false; // Track whether to show the success dialog

  @override
  void dispose() {
    // Dispose of the controllers to avoid memory leaks
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _showSuccess() {
    setState(() {
      _showSuccessDialog = true;
    });
  }

  void _hideSuccess() {
    setState(() {
      _showSuccessDialog = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF9EA),
        body: Stack(children: [
          if (_showSuccessDialog)
            ModalBarrier(
              color: Colors.black.withOpacity(0.6),
              dismissible: false,
            ),
          SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  SizedBox(
                    width: 68.w,
                  ),
                  Text(
                    'Forgot Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.black2,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 53.h,
              ),
              SizedBox(
                width: 350.w,
                child: Text('Create a new password',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 350.w,
                child: Text(
                  'Create a new password to access your\n account',
                  style: TextStyle(
                    color: AppColor.black33,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(width: 350.w, child: const Text('Password')),
              SizedBox(
                height: 4.h,
              ),
              CustomTextFormField(
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(width: 350.w, child: const Text('Confirm Password')),
              SizedBox(
                height: 4.h,
              ),
              CustomTextFormField(
                controller: confirmPasswordController,
                obscureText: true,
              ),
              SizedBox(
                height: 50.h,
              ),
              AppButton(
                height: 60.h,
                width: 370.w,
                buttonText: 'Reset Password',
                onTap: () {
                  _showSuccess();
                },
                buttonColor: AppColor.primaryColor,
                buttonTextColor: AppColor.pureWhite,
                fontSize: 16.sp,
              )
            ]),
          ),
          if (_showSuccessDialog)
            DialogueBox(
              dialogButton: AppButton(
                buttonColor: AppColor.primaryColor,
                height: 60.h,
                width: 370.w,
                buttonText: 'Continue',
                onTap: () {
                  _hideSuccess();
                },
                buttonTextColor: AppColor.pureWhite,
                fontSize: 16.sp,
              ),
              dialogIcon: Icon(
                size: 100.sp,
                color: const Color(0xFF08B839),
                Iconsax.tick_circle,
              ),
              dialogText: Text(
                'Your password has been reset successfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
        ]),
      ),
    );
  }
}
