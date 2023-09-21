import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
    required this.isEditable,
    this.onTap,
  });

  final bool isEditable;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      // padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColor.plainBlack,
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Center(
              child: CircleAvatar(
                radius: 75,
                //TODO: backgroundImage: Put an image here
              ),
            ),
          ),
          isEditable
              ? Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: onTap,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColor.primaryColor,
                      child: Icon(
                        Iconsax.edit_2,
                        size: 15,
                        color: AppColor.white2,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
