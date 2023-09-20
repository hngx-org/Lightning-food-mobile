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
      width: 75,
      height: 75,
      // padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColor.plainBlack,
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          const Padding(
            padding: const EdgeInsets.all(2),
            child: Center(
              child: CircleAvatar(
                radius: 65,
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
                      //TODO: Remove this color later
                      backgroundColor: Colors.purple.shade900,
                      //TODO: Change the icon
                      child: const Icon(
                        Iconsax.edit_2,
                        size: 15,
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
