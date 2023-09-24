import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/constants/controllers/admin_controllers.dart';
import 'package:lightning_food_mobile/main.dart';
import 'package:lightning_food_mobile/repositories/auth_repository.dart';
import 'package:lightning_food_mobile/view_models/auth_view_model.dart';
import 'package:lightning_food_mobile/views/Home/homeScreen.dart';
import 'package:lightning_food_mobile/views/login_view/login_screen.dart';
import 'package:lightning_food_mobile/views/sign_up_views/confirm_admin_signup.dart';
import 'package:lightning_food_mobile/views/sign_up_views/email_confirmation_screen.dart';
import 'package:lightning_food_mobile/views/signup_successful/signupSuccess.dart';




class AdminSignUpScreen extends ConsumerWidget {
  AdminSignUpScreen({super.key});

  // late TextEditingController _emailController;
  // final signUpProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  //   final signUpViewModel = ref.read(signUpViewModelProvider);
  //   return signUpViewModel.signUpAdmin(
  //     orgName: orgName.text,
  //     email: orgEmail.text,
  //     lunchPrice: lunchPrice.text,
  //     password: adminPassword.text,
  //   );
  // });

  // final res = ref.read(authRepoProvider).signUpAdmin(
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final signUp = ref.watch(signUpProvider);
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
                  controller: orgEmail,
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
                  controller: orgName,
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
                  controller: lunchPrice,
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
              SizedBox(height: 4.h,),
              SizedBox(height: 15.h),
              Text(
                'Password',
                style: TextStyle(fontSize: 16.sp),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.plainBlack),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                height: 56.h,
                child: TextField(
                  controller: adminPassword,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 12.sp),
                    hintText: '*********',
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
              SizedBox(height: 8.h),
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
              SizedBox(height: 60.h),
              AppButton(
                height: 50.h,
                buttonColor: AppColor.primaryColor,
                width: double.infinity,
                buttonText: 'Continue',
                fontSize: 16.sp,
                onTap: () async{

                 final details = await ref.read(authViewModelProvider).signUpAdmin(orgName: orgName.text,
                    email: orgEmail.text,
                    lunchPrice: lunchPrice.text,
                    password: adminPassword.text,);
                 print(details);
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>AdminSignIn(password: adminPassword.text , email: orgEmail.text)));
                  // signUp.when(data: (data){
                  //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Home()), (route) => false);
                  //   return CircularProgressIndicator();
                  //
                  // }, error: (error, stackTrace){
                  //   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error ${error}")));
                  // }, loading: (){
                  //   return CircularProgressIndicator();
                  // });

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomeScreen(),
                  //   ),
                  // );
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
