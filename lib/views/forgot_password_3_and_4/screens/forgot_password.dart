import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

import '../../constants/app_widgets.dart';
import 'text_field.dart';

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
              color:
                  Colors.black.withOpacity(0.6), // Adjust the opacity as needed
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
                  const Text(
                    'Forgot Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1E1B1C),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 47,
              ),
              SizedBox(
                width: 315,
                child: const Text('Create a new password',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w700,
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 315,
                child: const Text(
                  'Create a new password to access your\n account',
                  style: TextStyle(
                    color: Color(0xFF4C4C4C),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              SizedBox(width: 315, child: const Text('Password')),
              SizedBox(
                height: 4,
              ),
              CustomTextFormField(
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(width: 315, child: const Text('Confirm Password')),
              SizedBox(
                height: 4.h,
              ),
              CustomTextFormField(
                controller: confirmPasswordController,
                obscureText: true,
              ),
              SizedBox(
                height: 32.h,
              ),
              AppButton(
                  height: 20.h,
                  width: 270.w,
                  buttonText: 'Reset Password',
                  onTap: () {
                    _showSuccess();
                  },
                  buttonColor: AppColor.primaryColor)
            ]),
          ),
          if (_showSuccessDialog)
            DialogueBox(
              dialogButton: AppButton(
                buttonColor: AppColor.primaryColor,
                height: 20.h,
                width: 200.w,
                buttonText: 'Continue',
                onTap: () {
                  _hideSuccess();
                },
              ),
              dialogIcon: const Icon(
                size: 100,
                color: Color(0xFF08B839),
                Iconsax.tick_circle,
              ),
              dialogText: const Text(
                'Your password has been reset successfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
        ]),
      ),
    );
  }
}
