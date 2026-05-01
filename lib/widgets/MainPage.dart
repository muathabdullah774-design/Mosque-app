import 'package:flutter/material.dart';
import 'package:mouque/models/AppLayout.dart';
import 'package:mouque/widgets/Circles.dart';
import 'package:mouque/widgets/Home.dart';
import 'package:mouque/widgets/Reports.dart';
import 'package:mouque/widgets/Student.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
 

  int selctedindex = 0;

   void setIndex(int index){
    setState(() {
      selctedindex = index;
    });}
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [ Home(),Circles(),Text("Session"),
    Student(), Reports()  ];
    return Scaffold(
        appBar: AppLayout.appBar(selctedindex,),
      body: pages[selctedindex],
      bottomNavigationBar: AppLayout.bottomNav(selctedindex,setIndex),);

    
  }
}