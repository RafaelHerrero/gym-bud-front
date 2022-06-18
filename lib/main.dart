import 'package:flutter/material.dart';
import 'package:gym_bud_front/screens/login_screen.dart';
import 'package:gym_bud_front/utilities/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: boxColor,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: raisedButtonStyle,
        ),
      ),
      home: LoginScreen(),
    );
  }
}
