import 'package:flappwrite_water_tracker/app/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlAppwrite Water Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.blue),
          actionsIconTheme: IconThemeData(color: Colors.blue),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
