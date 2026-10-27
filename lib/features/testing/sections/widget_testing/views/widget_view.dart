import 'package:flutter/material.dart';
import 'package:flutter_study_hub/features/testing/sections/widget_testing/widgets/my_widget_one.dart';
import 'package:flutter_study_hub/features/testing/sections/widget_testing/widgets/user_profile_card.dart';

class WidgetView extends StatelessWidget {
  const WidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            MyWidgetOne(title: "This is title", message: "This is message"),
            UserProfileCard(name: "Tharusha Theekshana", email: "test@gmail.com", avatarUrl: "https://robohash.org/246.29.194.169.png")
          ],
        ),
      ),
    );
  }
}
