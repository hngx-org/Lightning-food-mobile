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

  @override
  void dispose() {
    // Dispose of the controllers to avoid memory leaks
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF9EA),
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                const SizedBox(
                  width: 68,
                ),
                const Text(
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1E1B1C),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 47,
            ),
            const SizedBox(
              width: 315,
              child: Text('Create a new password',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w700,
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              width: 315,
              child: Text(
                'Create a new password to access your\n account',
                style: TextStyle(
                  color: Color(0xFF4C4C4C),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            const SizedBox(width: 315, child: Text('Password')),
            const SizedBox(
              height: 4,
            ),
            CustomTextFormField(
              // labelText: 'Enter password',
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(width: 315, child: Text('Confirm Password')),
            const SizedBox(
              height: 4,
            ),
            CustomTextFormField(
              // labelText: 'Enter password',
              controller: confirmPasswordController,
              obscureText: true,
            ),
            const SizedBox(
              height: 84,
            ),
            AppButton(
                height: 20.h,
                width: 270.w,
                buttonText: 'Continue',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DialogueBox(
                              dialogButton: AppButton(
                                buttonColor: AppColor.primaryColor,
                                height: 20.h,
                                width: 250.w,
                                buttonText: 'Continue',
                                onTap: () {},
                              ),
                              dialogIcon: Icon(
                                size: 120,
                                Iconsax.tick_circle,
                              ),
                              dialogText: Text(
                                  'Your password has been reset\n successfully'),
                            )),
                  );
                },
                buttonColor: AppColor.primaryColor)
          ]),
        ),
      ),
    );
  }
}
