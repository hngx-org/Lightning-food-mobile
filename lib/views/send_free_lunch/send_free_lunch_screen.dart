import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/main.dart';
import 'package:lightning_food_mobile/views/send_free_lunch/choose_lunch_screen.dart';

import '../../constants/app_widgets.dart';
import '../../view_models/user_data_provider.dart';



class SendFreeLunch extends ConsumerStatefulWidget {
  const SendFreeLunch({super.key});

  @override
  ConsumerState<SendFreeLunch> createState() => _SendFreeLunchState();
}

class _SendFreeLunchState extends ConsumerState<SendFreeLunch> {
  @override

  Widget build(BuildContext context) {
    final userList = ref.watch(userDataProvider);
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
              SizedBox(
                height: 8.h,
              ),
              Image.asset(
                fit: BoxFit.contain,
                height: 24.h,
                width: 24.w,
                'images/celebrate_icon.png',
              ),
              SizedBox(
                height: 20.h,
              ),
              _textField(),
              SizedBox(
                height: 20.h,
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.plainBlack,width: 2),
        borderRadius: BorderRadius.circular(8.r)
      ),
      height: 44.h,
      width: 382.w,
      child: TextField(
        cursorColor: AppColor.plainBlack,
        style: TextStyle(fontSize: 14.sp),
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
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
