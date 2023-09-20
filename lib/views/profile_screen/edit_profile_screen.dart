import 'package:flutter/material.dart';

import 'widgets/edit_profile_text_field.dart';
import 'widgets/profile_icon.dart';
import 'widgets/custom_profile_app_bar.dart';
import 'dummy_data.dart';

//TODO: Probably change this to stateless when using state management
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController =
      TextEditingController(text: profileData['name']);
  TextEditingController displayNameController =
      TextEditingController(text: 'Maya');
  TextEditingController mailController = TextEditingController(
    text: profileData['email'],
  );
  TextEditingController idController = TextEditingController(
    text: profileData['id'],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomProfileAppBar(
        title: 'Edit Profile',
      ).build(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10).copyWith(bottom: 16),
        child: Column(
          children: [
            ProfileIcon(
              isEditable: true,
              onTap: () {
                //TODO: Edit the user image
              },
            ),
            const SizedBox(height: 35),
            EditProfileTextField(
              controller: nameController,
              fieldLabel: 'Name',
              validator: (input) {
                if (input != null && input.isNotEmpty) {
                  return null;
                } else {
                  return 'Name cannot be null';
                }
              },
            ),
            const SizedBox(height: 10),
            EditProfileTextField(
              controller: displayNameController,
              fieldLabel: 'Display Name',
              validator: (input) {
                if (input != null && input.isNotEmpty) {
                  return null;
                } else {
                  return 'Display name cannot be null';
                }
              },
            ),
            const SizedBox(height: 10),
            EditProfileTextField(
              controller: mailController,
              fieldLabel: 'Email',
              validator: (input) {
                if (input != null && input.isNotEmpty) {
                  return null;
                } else {
                  return 'Input a valid email';
                }
              },
            ),
            const SizedBox(height: 10),
            EditProfileTextField(
              controller: idController,
              fieldLabel: 'Staff Id',
              validator: null,
              enabled: false,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
