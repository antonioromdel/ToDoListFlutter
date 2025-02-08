import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/providers/taskProviders.dart';
import 'package:todolist/screens/taskListScreen.dart';
import 'package:todolist/theme/appTheme.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Taskproviders())],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(Object context) {
    return MaterialApp(
      title: "Flutter",
      debugShowCheckedModeBanner: false,
      theme: Apptheme.lightTheme,
      home: TaskListScreen(),
    );
  }
}
