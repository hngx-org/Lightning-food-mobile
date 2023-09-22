import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';

class CashGreenScreen extends StatefulWidget {
  const CashGreenScreen({super.key});

  @override
  State<CashGreenScreen> createState() => _CashGreenScreenState();
}

class _CashGreenScreenState extends State<CashGreenScreen> {
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController numberOfLunchController = TextEditingController();
  String? chooseBank;
  List<String> bank = ["Bank", "First Bank", "Polaris", "UBA", "GTB"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Iconsax.arrow_left),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: Text(
                    'Redeem Free Lunch For Cash',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: Text(
                    'Each Free Lunch Voucher is worth \$ 5 Naira!',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Please enter your account details to redeem \$ 5  cash for one free lunch',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 31.h,
                ),
                _textFieldTile(
                    text: 'Account Number',
                    textEditingController: accountNumberController),
                SizedBox(
                  height: 20.h,
                ),
                _textFieldTile(
                    text: 'Account Name',
                    textEditingController: accountNameController),
                SizedBox(
                  height: 20.h,
                ),
                _selectPaymentMethod('Bank', bank, 'Bank'),
                SizedBox(
                  height: 20.h,
                ),
                _textFieldTile(
                    text: 'Number of lunch you want to redeem',
                    textEditingController: accountNumberController),
                SizedBox(
                  height: 112.h,
                ),
                AppButton(
                    height: 48.h,
                    width: 383.w,
                    buttonText: 'Done',
                    buttonTextColor: Colors.white,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    buttonColor: AppColor.primaryColor,
                    fontSize: 14.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldTile(
      {required String text,
      required TextEditingController textEditingController}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 48.h,
          width: 382.w,
          child: TextField(
            controller: textEditingController,
            maxLines: 3,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _selectPaymentMethod(
      String text, List<String> bank, String selectedBank) {
    return Container(
      height: 48.h, // Set the height for the field
      width: 383.w,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: const SizedBox(),
        value: chooseBank,
        onChanged: (newValue) {
          setState(() {
            chooseBank = newValue!;
          });
        },
        items: bank.map((banks) {
          return DropdownMenuItem(
            value: banks,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(banks),
            ),
          );
        }).toList(),
        hint: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text('Select a bank'),
        ),
      ),
    );
  }
}
