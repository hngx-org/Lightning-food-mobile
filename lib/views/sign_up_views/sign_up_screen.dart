import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/views/login_view/login_screen.dart';
import 'package:lightning_food_mobile/views/sign_up_views/email_confirmation_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

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
                const Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                const Text(
                  'Welcome on board!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                const Text(
                  "Creat an account to enjoy the lightening employees's app.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 10.h),
                const Text(
                    'To get started, we just need a few details from you'),
                SizedBox(height: 10.h),
                const Text('Email Address'),
                SizedBox(height: 5.h),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'e.g. kayjay@gmail.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  height: 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                          width: 0,
                        ),
                      ),
                      const Expanded(flex: 2, child: SizedBox()),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                AppButton(
                  height: 50,
                  buttonColor: AppColor.primaryColor,
                  width: double.infinity,
                  buttonText: 'Continue',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmailConfirmationScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Have an account already?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
