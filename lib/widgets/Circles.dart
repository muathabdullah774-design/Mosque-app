import 'package:flutter/material.dart';
class Circles extends StatefulWidget {
  const Circles({super.key});

  @override
  State<Circles> createState() => _CirclesState();
}

class _CirclesState extends State<Circles> {

  List circles = [
    "حلقة الفاروق",
    "حلقة الصديق",
    "حلقة عثمان ابن عفان"
  ];

  void addCircle() {

    setState(() {
      circles.add("حلقة جديدة");
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: addCircle,
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(

        itemCount: circles.length,

        itemBuilder: (context,index){

          return Card(

            child: ListTile(

              leading: const Icon(Icons.groups),

              title: Text(circles[index]),

              trailing: const Icon(Icons.arrow_forward),

              onTap: (){

              },

            ),

          );

        },

      ),

    );
  }
}