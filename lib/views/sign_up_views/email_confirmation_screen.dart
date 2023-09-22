import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/views/signup_successful/signupSuccess.dart';

class EmailConfirmationScreen extends StatefulWidget {
  const EmailConfirmationScreen({super.key});

  @override
  State<EmailConfirmationScreen> createState() =>
      _EmailConfirmationScreenState();
}

class _EmailConfirmationScreenState extends State<EmailConfirmationScreen> {
  late TextEditingController _codeController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
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
          'Confirmation',
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
                'Check your email for a confirmation code',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.h),
              const Text("We've sent a 6 digit code to mayacox@gmail.com."),
              const Text("The code expires shortly, so please enter it soon."),
              SizedBox(height: 22.h),
              const Text('Confirmation code'),
              SizedBox(height: 4.h),
              TextField(
                controller: _codeController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'e.g. kayjay@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
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
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: AppColor.primaryColor,
                        width: 0,
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
              ),
              SizedBox(height: 84.h),
              AppButton(
                height: 48.h,
                width: double.infinity,
                buttonColor: AppColor.primaryColor,
                buttonText: 'Continue',
                buttonTextColor: AppColor.pureWhite,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpSuccessfulPage(),
                    ),
                  );
                },
                fontSize: 16.sp,
              ),
              SizedBox(height: 107.h),
              const Center(
                child: Text("Can't find your code? Check your spam folder!"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }
}
