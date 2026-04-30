import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  Widget card(String title, String number, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 32),
            const SizedBox(height: 10),
            Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              card("الطلاب", "35", Icons.person),
              card("الحلقات", "4", Icons.groups),
              card("الحضور", "28", Icons.check),
              card("الغياب", "7", Icons.close),
            ],
          ),
        ),
      ),
    );
  }
}
