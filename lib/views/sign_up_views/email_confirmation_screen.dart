import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/view_models/user_data_provider.dart';
import 'package:lightning_food_mobile/views/password/password_screen.dart';

class EmailConfirmationScreen extends ConsumerStatefulWidget {
  const EmailConfirmationScreen({super.key});

  @override
  ConsumerState<EmailConfirmationScreen> createState() =>
      _EmailConfirmationScreenState();
}

class _EmailConfirmationScreenState
    extends ConsumerState<EmailConfirmationScreen> {
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
              Text(
                "We've sent a 6 digit code to mayacox@gmail.com.",
                style: TextStyle(fontSize: 14.sp),
              ),
              Text(
                "The code expires shortly, so please enter it soon.",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 22.h),
              Text(
                'Confirmation code',
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 4.h),
              Container(
                height: 56.h,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.plainBlack),
                    borderRadius: BorderRadius.circular(8.r)),
                child: TextField(
                  controller: _codeController,
                  style: TextStyle(fontSize: 14.sp),
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
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
                onTap: () async {
                  //TODO: Fix this guy later
                  await ref.read(userDataProvider).confirmUser(
                        confirmationCode: _codeController.text,
                      );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PasswordScreen(),
                    ),
                  );
                },
                fontSize: 16.sp,
              ),
              SizedBox(height: 107.h),
              Center(
                child: Text(
                  "Can't find your code? Check your spam folder!",
                  style: TextStyle(fontSize: 14.sp),
                ),
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
