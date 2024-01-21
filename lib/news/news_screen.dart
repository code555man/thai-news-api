// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/news/homepage.dart';
void main(List<String> args) {
  runApp(News());
}

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}