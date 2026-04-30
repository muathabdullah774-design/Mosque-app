import 'package:flutter/material.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {

  List students = [
    "Ahmed",
    "Mohammed",
    "Ali"
  ];

  final controller = TextEditingController();

  void addStudent(){

    setState(() {
      students.add(controller.text);
    });

    controller.clear();

  }

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.all(16),

      child: Column(

        children: [

          TextField(

            controller: controller,

            decoration: const InputDecoration(
              labelText: "Student Name",
              border: OutlineInputBorder(),
            ),

          ),

          const SizedBox(height:10),

          ElevatedButton(
            onPressed: addStudent,
            child: const Text("Add Student"),
          ),

          const SizedBox(height:20),

          Expanded(

            child: ListView.builder(

              itemCount: students.length,

              itemBuilder: (context,index){

                return ListTile(

                  title: Text(students[index]),

                  leading: const Icon(Icons.person),

                );

              },

            ),

          )

        ],

      ),

    );

  }
}