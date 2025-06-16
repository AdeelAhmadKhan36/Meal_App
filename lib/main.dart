import 'package:flutter/material.dart';
import 'package:meal_app/src/feautres/catagory/view/category.dart';
import 'package:meal_app/src/feautres/tabs/meal_tab.dart';
import 'package:meal_app/src/them/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,

      // home: Categorypage(),
      home: TabScreen(),
    );
  }
}
