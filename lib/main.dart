import 'package:flutter/material.dart';
import 'package:mouque/widgets/MainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState()=> _MyAppstate(); }

class _MyAppstate extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
           home: Mainpage(),
    );
  }}
