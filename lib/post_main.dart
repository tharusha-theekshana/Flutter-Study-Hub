import 'package:flutter/material.dart';

import 'features/testing/sections/integration_testing/views/post_View.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study Hub - Post App',
      theme: ThemeData.light(
          useMaterial3: true
      ),
      home: PostView(),
    );
  }
}
