import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightning_food_mobile/views/login_view/admin_signup_screen.dart';
import 'package:lightning_food_mobile/views/login_view/login_screen.dart';
import 'package:lightning_food_mobile/views/signup_successful/reusable_confetti.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final dynamic confettiController = ConfettiController();
  @override
  void initState() {
    super.initState();
    confettiController.play();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  Widget SizedBoxH(double h) {
    return SizedBox(
      height: h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyConfetti(controller: confettiController),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 20, 88, 0),
              child: SizedBox(
                width: 306.w,
                height: 36.h,
                child: Text(
                  'HNGx Team-Lightning',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: Container(
                width: 210.w,
                height: 219.h,
                decoration: const ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Color(0xFFFFDB58), Color(0x00FFE278)],
                  ),
                  shape: OvalBorder(),
                ),
                child: Center(
                  child: Text(
                    'USER',
                    style: TextStyle(
                      color: const Color(0xFF4C4C4C),
                      fontSize: 24.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminSignUpScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 210.w,
                  height: 219.h,
                  decoration: const ShapeDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [Color(0x00FFA776), Color(0xFFFFA776)]),
                    shape: OvalBorder(),
                  ),
                  child: const Center(
                    child: Text(
                      'ADMIN',
                      style: TextStyle(
                        color: Color(0xFF4C4C4C),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
