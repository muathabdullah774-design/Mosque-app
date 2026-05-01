import 'package:flutter/material.dart';

class Reports extends StatelessWidget {

  const Reports({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(

      children: [

        ListTile(
          leading: const Icon(Icons.bar_chart),
          title: const Text("Students Report"),
          onTap: (){},
        ),

        ListTile(
          leading: const Icon(Icons.groups),
          title: const Text("Circles Report"),
          onTap: (){},
        ),

        ListTile(
          leading: const Icon(Icons.star),
          title: const Text("Top Students"),
          onTap: (){},
        ),

      ],

    );

  }
}