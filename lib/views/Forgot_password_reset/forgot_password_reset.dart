import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/views/forgot_password_3_and_4/screens/forgot_password.dart';
import '../../constants/app_widgets.dart';

class ForgotPasswordReset extends StatefulWidget {
  const ForgotPasswordReset({super.key});

  @override
  State<ForgotPasswordReset> createState() => _ForgotPasswordResetState();
}

class _ForgotPasswordResetState extends State<ForgotPasswordReset> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon:  Icon(Icons.arrow_back_ios_new, color: AppColor.black2,)),
        centerTitle: true,
        title: Text(
          'Forgot Password',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColor.black2),
        ),
        backgroundColor: AppColor.bgColor,
      ),
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        minimum: EdgeInsets.all(24.r),
        child: SingleChildScrollView(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Reset Password',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColor.plainBlack),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Don’t Panic, We’ll just reset your password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.black33,
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              'Email Address',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black33),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              cursorColor: AppColor.primaryColor,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColor.black33), // Set the border color here
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColor.plainBlack), // Set the border color here
                ),
                hintText: 'e.g. kayjay@gmail.com',
                hintStyle: TextStyle(color: AppColor.lightBlack),
              ),
            ),
            const SizedBox(
              height: 84,
            ),
            AppButton(
              height: 48.h,
              width: 382.w,
              buttonText: 'Reset Password',
              onTap: () {
               showDialog(context: context,
                   builder: (_){
                 return DialogueBox(
                   dialogButton: AppButton(
                     buttonColor: AppColor.primaryColor,
                     height: 48.h,
                     width: 322.w,
                     buttonText: 'Continue',
                     onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgotPassword()));
                     }, buttonTextColor: AppColor.pureWhite, fontSize: 16.sp,
                   ),
                   dialogIcon: Image.asset(
                     'images/tick_circle.png',
                     height: 100.h,
                     width: 100.w,
                   ),
                   dialogText: Text(
                     'A password reset link has been sent\nto your email',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                         color: AppColor.black2,
                         fontSize: 14.sp,
                         fontWeight: FontWeight.w600),
                   ),
                 );
                   });
              },
              buttonColor: AppColor.primaryColor,
              buttonTextColor: AppColor.pureWhite, fontSize: 16,),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
