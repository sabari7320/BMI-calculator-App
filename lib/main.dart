import 'package:bmi/screen/input_page.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        accentColor: Colors.purple,
        textTheme: TextTheme(
          bodyText2: TextStyle(color:Color(0xFFFFFFFF))
        )

      ),
      home:MyHomePage(),
    );
  }
}

