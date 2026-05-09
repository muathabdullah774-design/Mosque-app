import 'package:flutter/material.dart';
import 'package:mouque/models/AppLayout.dart';
import 'package:mouque/widgets/Circles.dart';
import 'package:mouque/widgets/Home.dart';
import 'package:mouque/widgets/Reports.dart';
import 'package:mouque/widgets/Session.dart';
import 'package:mouque/widgets/Student.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {

  int selctedindex = 0;

   void setIndex(int index){
    setState(() {
      selctedindex = index;
    });}
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [ Home(),Circles(),Session(),
    Student(), Reports()  ];
    return Scaffold(
        appBar: AppLayout.appBar(selctedindex,),
        endDrawer : AppLayout.appDrawer(context),
      body: pages[selctedindex],
      bottomNavigationBar: AppLayout.bottomNav(selctedindex,setIndex),);

    
  }
}