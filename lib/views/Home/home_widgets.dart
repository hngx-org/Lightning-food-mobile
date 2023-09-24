import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lightning_food_mobile/view_models/user_data_provider.dart';
import 'package:lightning_food_mobile/views/redeem_free_lunch/redeemGreen.dart';

class RecentFreeLunchView extends ConsumerWidget {
  const RecentFreeLunchView(
      {this.icon,
      required this.iconColor,
      required this.containerHeight,
      required this.tileTitle,
      required this.onTap,
      super.key});

  final Widget? icon;
  final Color iconColor;
  final double containerHeight;
  final String tileTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, ref) {
    final homeUserDetails = ref.watch(userDataProvider);
    List<String> iconArrow = [
      'images/arrow-up_red.svg',
      'images/arrow-up_green.svg',
    ];
    return SizedBox(
      height: containerHeight,
      child: ListView.builder(
          itemCount: homeUserDetails.lunchHistory.length,
          itemBuilder: (BuildContext context, int index) {
            final allLunch = homeUserDetails.lunchHistory;
            return ListTile(
              leading:
                  allLunch[index].senderId == homeUserDetails.loginData.user.id
                      ? SvgPicture.asset(iconArrow[0])
                      : SvgPicture.asset(iconArrow[1]),
              title: Text(
                allLunch[index].senderId == homeUserDetails.loginData.user.id
                    ? 'You sent a free lunch to ${homeUserDetails.getUserById(allLunch[index].receiverId.toString())}'
                    : '${homeUserDetails.getUserById(allLunch[index].senderId.toString())} sent you a free luunch',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                //TODO: Set in the controller that the lunch history has been clicked
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RedeemScreen(),
                  ),
                );
              },
              trailing: Text(
                allLunch[index].createdAt,
                style: TextStyle(fontSize: 11.sp),
              ),
            );
          }),
    );
  }
}
