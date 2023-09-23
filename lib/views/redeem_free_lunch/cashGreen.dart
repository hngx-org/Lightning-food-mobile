import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/main.dart';

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
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 38.h,),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Iconsax.arrow_left),
                ),
                SizedBox(
                  height: 30.h,
                ),
<<<<<<< HEAD
                SizedBox(
=======
                Container(
>>>>>>> main
                  width: 382.w,
                  child: Text(
                    'Redeem Free Lunch For Cash',
                    textAlign: TextAlign.center,
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
<<<<<<< HEAD
                SizedBox(
=======
                Container(
>>>>>>> main
                  width: 382.w,
                  child: Column(
                    children: [
                      Text(
                        'Each Free Lunch Voucher is worth \$ 5 Naira!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
<<<<<<< HEAD
                SizedBox(
=======
                Container(
>>>>>>> main
                  width: 382.w,
                  child: Text(
                    'Please enter your account details to redeem \$ 5  cash for one free lunch',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
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
                    textEditingController: numberOfLunchController),
                SizedBox(
                  height: 112.h,
                ),
                AppButton(
                    height: 48.h,
                    width: 383.w,
                    buttonText: 'Done',
                    buttonTextColor: Colors.white,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => DialogueBox(
                          dialogIcon: SvgPicture.asset(
                              'images/vuesax-outline-tick-circle.svg'),
                          dialogText: Text('Successfully',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp)),
                          dialogButton: AppButton(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            height: 48.h,
                            width: 383.w,
                            buttonText: 'Close',
                            buttonTextColor: Colors.white,
                            buttonColor: AppColor.primaryColor,
                            fontSize: 14.sp,
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (_) => const Home()),
                                  (route) => false);
                            },
                          ),
                        ),
                      );
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
            cursorColor: AppColor.plainBlack,
            style: TextStyle(fontSize: 14.sp),
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
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: Text(banks,style: TextStyle(fontSize: 14.sp),),
            ),
          );
        }).toList(),
        hint: Padding(
          padding: EdgeInsets.only(left: 8.0.w),
          child: Text('Select a bank',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color: AppColor.black2),),
        ),
      ),
    );
  }
}
