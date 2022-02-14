import 'package:flutter/material.dart';
import 'package:mygarageadmin/screens/fourth_screen.dart';
import 'package:mygarageadmin/screens/second_screen.dart';
import 'package:mygarageadmin/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SplashScreen(),
    );
  }
}
