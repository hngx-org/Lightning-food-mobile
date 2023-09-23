import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/views/login_view/login_screen.dart';

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
                height: 47.h,
              ),
              SizedBox(
                width: 350.w,
                child: Text('Create a new password',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: 382.w,
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
                height: 22.h,
              ),
              SizedBox(width: 382.w, child: Text('Password',style: TextStyle(fontSize: 14.sp),)),
              SizedBox(
                height: 4.h,
              ),
              CustomTextFormField(
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(width: 382.w, child:Text('Confirm Password',style: TextStyle(fontSize: 14.sp),)),
              SizedBox(
                height: 4.h,
              ),
              CustomTextFormField(
                controller: confirmPasswordController,
                obscureText: true,
              ),
              SizedBox(
                height: 84.h,
              ),
              AppButton(
                height: 48.h,
                width: 382.w,
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
                height: 48.h,
                width: 332.w,
                buttonText: 'Continue',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginScreen()));
                },
                buttonTextColor: AppColor.pureWhite,
                fontSize: 16.sp,
              ),
              dialogIcon: const Icon(
                size: 100,
                color: Color(0xFF08B839),
                Iconsax.tick_circle,
              ),
              dialogText: Text(
                'Your password has been reset \nsuccessfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
        ]),
      ),
    );
  }
}
