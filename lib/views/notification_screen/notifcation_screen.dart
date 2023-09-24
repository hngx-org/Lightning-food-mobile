import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
            Navigator.pop(context);
          },
          child: const Icon(
            Iconsax.arrow_left,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Notification',
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Container(
                margin: EdgeInsets.only(left: 24.w),
                child: Text(
                  "New",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                //TODO: Changed this screen
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // UserData userToSend = userList.allUsers[index];
                    List<Color> color = [
                      AppColor.secondaryColor,
                      AppColor.tetiaryColor,
                    ];
                    List<String> imageIcon = [
                      'images/heart.png',
                      'images/icon.png',
                    ];
                    return CustomContactsListTile(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => const ChooseLunchScreen(),
                        //   ),
                        // );
                      },
                      containerHeight: 50.h,
                      profilePath:
                          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngegg.com%2Fen%2Fsearch%3Fq%3Davatar&psig=AOvVaw2XUsoeIo0Ohx4nRrGRIuH_&ust=1695673102492000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCOCf99mIxIEDFQAAAAAdAAAAABAE',
                      tileTitle: 'Angela Yu',
                      time: null,
                      conColor: color[index % 2],
                      image: imageIcon[index % 2],
                      isVisible: false,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 16.h,
                    );
                  },
                  itemCount: 1,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 24.w),
                child: Text(
                  "Older",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                //TODO: Changed this screen
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // UserData userToSend = userList.allUsers[index];
                    List<Color> color = [
                      AppColor.secondaryColor,
                      AppColor.tetiaryColor,
                    ];
                    List<String> imageIcon = [
                      'images/heart.png',
                      'images/icon.png',
                    ];
                    return CustomContactsListTile(
                      onTap: () {},
                      containerHeight: 50.h,
                      profilePath:
                          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngegg.com%2Fen%2Fsearch%3Fq%3Davatar&psig=AOvVaw2XUsoeIo0Ohx4nRrGRIuH_&ust=1695673102492000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCOCf99mIxIEDFQAAAAAdAAAAABAE',
                      tileTitle: 'Angela Yu',
                      time: null,
                      conColor: color[index % 2],
                      image: imageIcon[index % 2],
                      isVisible: false,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 16.h,
                    );
                  },
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
