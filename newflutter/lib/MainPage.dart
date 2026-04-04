import 'package:flutter/material.dart';
import 'package:mouque/AppLayout.dart';
import 'Home.dart';
import 'Circles.dart' hide Circles;
import 'About.dart';
import 'Reports.dart';
import 'Session.dart';
import 'Student.dart';
import 'Users.dart';
import 'Reports.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState()=> _MainPageState(); }

class _MainPageState extends State<MainPage>{
  @override


  int currentIndex =0;

  final pages =[const Home(),
    const Circles(),"Session",
    const Student(),const Reports()
  ];

  final titles=["Home","Circles","Session","Student","Reports"];

  void setIndex(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppLayout.appBar(currentIndex,),
      body: Column(children: [Icon(Icons.padding_sharp),],),
      bottomNavigationBar: AppLayout.bottomNav(currentIndex,setIndex),
    );
  }}