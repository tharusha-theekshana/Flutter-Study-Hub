import 'package:flutter/material.dart';
import 'package:flutter_study_hub/features/firebase/firestore/views/todo_view.dart';
import 'package:flutter_study_hub/features/testing/sections/widget_testing/views/widget_view.dart';

class TestingHomeView extends StatelessWidget {
  const TestingHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Testing Study Sections")),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WidgetView();
                    },
                  ),
                );
              },
              child: Text("Widget Testing"),
            ),
          ],
        ),
      ),
    );
  }
}
