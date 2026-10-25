import 'package:flutter/material.dart';

import 'features/testing/sections/unit_testing/views/todo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study Hub - Todo App',
      theme: ThemeData.light(
          useMaterial3: true
      ),
      home: TodoView(),
    );
  }
}
