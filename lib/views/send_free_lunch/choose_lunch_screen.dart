import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:lightning_food_mobile/view_models/user_data_provider.dart';
import 'package:lightning_food_mobile/views/send_free_lunch/send_free_lunch_screen.dart';

class ChooseLunchScreen extends ConsumerStatefulWidget {
  const ChooseLunchScreen({super.key});

  @override
  ConsumerState<ChooseLunchScreen> createState() => _ChooseLunchScreenState();
}

class _ChooseLunchScreenState extends ConsumerState<ChooseLunchScreen> {
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_scrollToTextField);
  }

  void _scrollToTextField() {
    _scrollController.animateTo(
      500.0,
      duration: const Duration(milliseconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNode.removeListener(_scrollToTextField);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeUserDetails = ref.watch(userDataProvider);
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        centerTitle: true,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: ListView(
            controller: _scrollController,
            clipBehavior: Clip.none,
            children: [
              _singleSendLunchTile(
                  profilePath: 'images/lady.jpeg', tileText: 'Joy Lu'),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'How many lunches will you like to send?',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton(
                      height: 87.h,
                      width: 96.w,
                      buttonText: '1 Free\nLunch',
                      buttonTextColor: Colors.white,
                      onTap: () {
                        quantityController.text = "1";
                      },
                      buttonColor: AppColor.primaryColor,
                      fontSize: 12.sp),
                  AppButton(
                      height: 87.h,
                      width: 96.w,
                      buttonText: 'Double\nFree\nLunch',
                      buttonTextColor: Colors.black,
                      onTap: () {
                        quantityController.text = "2";
                      },
                      buttonColor: AppColor.secondaryColor,
                      fontSize: 12.sp),
                  AppButton(
                      height: 87.h,
                      width: 96.w,
                      buttonText: 'Triple\nFree\nLunch',
                      buttonTextColor: Colors.black,
                      onTap: () {
                        quantityController.text = "3";
                      },
                      buttonColor: AppColor.tetiaryColor,
                      fontSize: 12.sp),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Add note (Optional)',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              _sendNoteTextField(noteController),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '400 Characters remaining',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              AppButton(
                  height: 48.h,
                  width: 133.w,
                  buttonText: 'Send Free Lunch',
                  buttonTextColor: Colors.white,
                  onTap: () {
                    homeUserDetails.sendFreeLunch(
                        note: noteController.text,
                        quantity: quantityController.text);

                    showDialog(
                      context: context,
                      builder: (_) => DialogueBox(
                        dialogIcon: SvgPicture.asset(
                            'images/vuesax-outline-tick-circle.svg'),
                        dialogText: Text(
                            'You have sent a free lunch to Joy Lu ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14.sp)),
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
                                    builder: (_) => const SendFreeLunch()),
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
    );
  }

  Widget _sendNoteTextField(TextEditingController controller) {
    return SizedBox(
      height: 168.h,
      width: 382.w,
      child: TextField(
        controller: controller,
        cursorColor: AppColor.plainBlack,
        style: TextStyle(fontSize: 14.sp),
        maxLines: 20,
        focusNode: _focusNode,
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
    );
  }

  Widget _singleSendLunchTile(
      {required String profilePath, required String tileText}) {
    return Container(
      height: 68.h,
      width: 400.w,
      decoration: BoxDecoration(
        color: AppColor.secondaryColor,
        border: Border.all(width: 2.h, color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 5.w,
          ),
          Container(
            height: 55.h,
            width: 62.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2.w),
              image: DecorationImage(
                image: AssetImage(profilePath),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          SizedBox(
            width: 12.h,
          ),
          Text(
            tileText,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
