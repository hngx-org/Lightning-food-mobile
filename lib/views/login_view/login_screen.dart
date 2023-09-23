import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/main.dart';
import 'package:lightning_food_mobile/views/Forgot_password_reset/forgot_password_reset.dart';
import 'package:lightning_food_mobile/views/sign_up_views/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        centerTitle: true,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Iconsax.arrow_left,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Login',
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w,right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  height: 1.5.h,
                  color: AppColor.plainBlack,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Happy to see you again, Please log in below',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.5.h,
                  color: AppColor.black33,
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              _reusableTextField(false, 'e.g. kayjay@gmail.com',
                  'Email Address', null, emailController),
              SizedBox(
                height: 12.h,
              ),
              _reusableTextField(
                  !_isPasswordVisible,
                  'Enter your password',
                  'Password',
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    child: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  passwordController),
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordReset(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.plainBlack,
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.5.h,
                    ),
                  ),
                  child: const Text('Forgot Password?'),
                ),
              ),
              SizedBox(
                height: 84.h,
              ),
              AppButton(
                height: 48.h,
                width: 382.w,
                buttonText: 'Login',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  );
                },
                buttonColor: AppColor.primaryColor,
                buttonTextColor: AppColor.pureWhite,
                fontSize: 16.sp,
              ),
              SizedBox(
                height: 107.h,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5.h,
                      color: AppColor.black2,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Don’t Have an Account? ',
                      ),
                      TextSpan(
                        text: 'Create account',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reusableTextField(bool isObscure, String hintText, String text,
      Widget? icon, TextEditingController textEditingController) {
    return SizedBox(
      height: 100.h,
      width: 382.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          SizedBox(
            height: 56.h,
            width: 382.w,
            child: TextField(
              obscureText: isObscure,
              controller: textEditingController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(16, 19, 16, 19),
                hintText: hintText,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.plainBlack),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.plainBlack),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.plainBlack),
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: icon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
