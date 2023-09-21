import 'package:flutter/material.dart';

import 'widgets/custom_profile_app_bar.dart';
import 'widgets/profile_segment.dart';
import 'widgets/profile_segment_2.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomProfileAppBar(
        title: 'Profile',
      ).build(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10).copyWith(bottom: 16),
        child: const Column(
          children: [
            ProfileSegment(),
            SizedBox(height: 12),
            ProfileSegment2(),
          ],
        ),
      ),
    );
  }
}
