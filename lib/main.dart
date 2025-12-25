import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/theme/app_theme.dart';
import 'package:to_do_list_app/features/todo/presentation/screens/todo_list_screen.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const ToDoListScreen(),
    );
  }
}

void main() {
  runApp(const ToDoApp());
}
