import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColor.bgColor,
      elevation: 0,
      title: Text(
        title,
        //TODO: Change the font
        style: TextStyle(
          color: AppColor.plainBlack,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Iconsax.arrow_left),
        color: AppColor.plainBlack,
      ),
    );
  }
}
