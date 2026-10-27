import 'package:flutter/material.dart';
import 'package:flutter_study_hub/features/firebase/firestore/views/todo_view.dart';

class FirebaseHome extends StatelessWidget {
  const FirebaseHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase Study Sections")),
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
                      return TodoView();
                    },
                  ),
                );
              },
              child: Text("Firebase Firestore"),
            ),
          ],
        ),
      ),
    );
  }
}
