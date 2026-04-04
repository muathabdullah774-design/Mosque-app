import 'package:flutter/material.dart';
import 'package:mouque/Circles.dart';
import 'package:mouque/Home.dart';
import 'package:mouque/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  State<MyApp> createState()=> _MyAppstate(); }

class _MyAppstate extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Loginpage()
    );
  }}
