import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/main.dart';
import 'package:lightning_food_mobile/views/send_free_lunch/choose_lunch_screen.dart';

import '../../constants/app_widgets.dart';

class SendFreeLunch extends StatelessWidget {
  const SendFreeLunch({super.key});

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
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const Home()),
                (route) => false);
          },
          child: const Icon(
            Iconsax.arrow_left,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Send Free Lunch',
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 5.h,
          ),
          child: Column(
            children: [
              Text(
                'Reward a deserving colleague with free lunch!',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Image.asset(
                height: 24.h,
                width: 24.w,
                'images/celebrate_icon.png',
              ),
              const SizedBox(
                height: 20,
              ),
              _textField(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: ContactListView(
                  iconImage: false,
                  tileTitle: 'Joy Lu',
                  containerHeight: 68.h,
                  listNumber: 20,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ChooseLunchScreen(),
                      ),
                    );
                  },
                  profilePath: 'images/lady.jpeg',
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField() {
    return SizedBox(
      height: 44.h,
      width: 382.w,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF9C9C9C),
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFC5C5C5),
          ),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 1.5.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(width: 1.5),
          ),
        ),
      ),
    );
  }
}
