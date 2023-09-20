import 'package:flutter/material.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

class EditProfileTextField extends StatelessWidget {
  const EditProfileTextField({
    super.key,
    required this.controller,
    required this.fieldLabel,
    required this.validator,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String fieldLabel;
  final String? Function(String?)? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final hintText = controller.text;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldLabel,
          style: TextStyle(
            fontSize: 14,
            color: enabled ? AppColor.plainBlack : AppColor.black33,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          enabled: enabled,
          validator: validator != null
              ? (value) {
                  return validator!(value);
                }
              : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
