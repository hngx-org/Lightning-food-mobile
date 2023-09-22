import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/main.dart';
import 'package:lightning_food_mobile/views/sign_up_views/sign_up_screen.dart';

import '../Forgot_password_reset/forgot_password_reset.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 107),
                        width: double.infinity.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 84),
                              width: double.infinity.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 22),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 16),
                                          child: Text(
                                            'Welcome back!',
                                            style: TextStyle(
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w700,
                                              height: 1.5.h,
                                              color: AppColor.plainBlack,
                                            ),
                                          ),
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
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 24),
                                          width: double.infinity.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 12),
                                                width: double.infinity.w,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(0, 0, 0, 4),
                                                      child: Text(
                                                        'Email Address',
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.5.h,
                                                          color:
                                                              AppColor.black2,
                                                        ),
                                                      ),
                                                    ),
                                                    TextField(
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                16, 19, 16, 19),
                                                        hintText:
                                                            'e.g. kayjay@gmail.com',
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColor
                                                                  .plainBlack),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColor
                                                                  .plainBlack),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColor
                                                                  .plainBlack),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: double.infinity.w,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .fromLTRB(0,
                                                                    15, 0, 4),
                                                            child: Text(
                                                              'Password',
                                                              style: TextStyle(
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: 1.5.h,
                                                                color: AppColor
                                                                    .black2,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .fromLTRB(
                                                                    12,
                                                                    12,
                                                                    16,
                                                                    8),
                                                            width: double
                                                                .infinity.w,
                                                            height: 56.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: AppColor
                                                                      .plainBlack),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      TextField(
                                                                    obscureText:
                                                                        !_isPasswordVisible,
                                                                    decoration:
                                                                        const InputDecoration(
                                                                      hintText:
                                                                          'Enter your password',
                                                                      border: InputBorder
                                                                          .none,
                                                                    ),
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                  icon: Icon(_isPasswordVisible
                                                                      ? Icons
                                                                          .visibility_off
                                                                      : Icons
                                                                          .visibility),
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      _isPasswordVisible =
                                                                          !_isPasswordVisible;
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const ForgotPasswordReset(),
                                              ),
                                            );
                                          },
                                          style: TextButton.styleFrom(
                                            foregroundColor:
                                                AppColor.plainBlack,
                                            textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              height: 1.5.h,
                                            ),
                                          ),
                                          child: const Text('Forgot Password?'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
                              buttonTextColor: AppColor.pureWhite, fontSize: 16.sp,
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
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
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
