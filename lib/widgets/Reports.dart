import 'package:flutter/material.dart';

class Reports extends StatelessWidget {

  const Reports({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(

      children: [

        ListTile(
          leading: const Icon(Icons.bar_chart),
          title: const Text("تقارير الطلاب"),
          onTap: (){},
        ),

        ListTile(
          leading: const Icon(Icons.groups),
          title: const Text("تقارير الحلقات"),
          onTap: (){},
        ),

        ListTile(
          leading: const Icon(Icons.star),
          title: const Text("افضل الطلاب"),
          onTap: (){},
        ),

      ],

    );

  }
}