import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/views/login_view/login_screen.dart';
import 'package:lightning_food_mobile/views/sign_up_views/email_confirmation_screen.dart';

class AdminSignUpScreen extends StatefulWidget {
  const AdminSignUpScreen({super.key});

  @override
  State<AdminSignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<AdminSignUpScreen> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: AppColor.black2,
        backgroundColor: AppColor.bgColor,
        elevation: 0,
        title: Text(
          'Register ',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome on board!',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Create an account to enjoy the lightening employees's app.",
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 28.h),
              Text('Create Account',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(height: 16.h),
              Text(
                'To get started, we just need a few details from you',
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 22.h),
              Text(
                'Email Address',
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 4.h),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.plainBlack),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                height: 56.h,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 12.sp),
                    hintText: 'e.g. kayjay@gmail.com',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'Organisation Name',
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 4.h),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.plainBlack),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                height: 56.h,
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 12.sp),
                    hintText: 'e.g. Extrano Empire',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'Lunch Price',
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 4.h),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.plainBlack),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                height: 56.h,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 12.sp),
                    hintText: 'e.g. 10000',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                height: 4.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.sp),
                  border: Border.all(),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: AppColor.primaryColor,
                        width: 0,
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                    const Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
              ),
              SizedBox(height: 84.h),
              AppButton(
                height: 50.h,
                buttonColor: AppColor.primaryColor,
                width: double.infinity,
                buttonText: 'Continue',
                fontSize: 16.sp,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmailConfirmationScreen(),
                    ),
                  );
                },
                buttonTextColor: AppColor.pureWhite,
              ),
              SizedBox(height: 107.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account already?',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
