import 'package:figma/screen/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:figma/data/review_data.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: ReviewScreen(reviews: reviews),
    );
  }
}

