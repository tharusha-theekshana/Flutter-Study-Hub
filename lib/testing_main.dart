import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_hub/features/testing/core/testing_home_view.dart';

import 'features/firebase/firestore/firebase_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study Hub - Testing',
      theme: ThemeData.light(
          useMaterial3: true
      ),
      home: TestingHomeView(),
    );
  }
}
