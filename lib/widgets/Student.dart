import 'package:flutter/material.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  List students = [
    "احمد",
    "محمد",
    "علي",
     "معاذ",
    "خالد",
    "سلمان",
    "عبدالله",
    "فهد",
    "سعيد",
    "عبدالرحمن",
    "مسعد",
    "ناصر",
    "سعود",
  ];

  final controller = TextEditingController();

  void addStudent() {
    if (controller.text.isNotEmpty) {
      setState(() {
        students.add(controller.text);
      });

      controller.clear();
    }
  }

  // حذف طالب
 void removeStudent(int index) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("تأكيد الحذف"),
        content: Text(
          "هل أنت متأكد من حذف الطالب ${students[index]} ؟",
        ),
        actions: [

          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("إلغاء"),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              setState(() {
                students.removeAt(index);
              });

              Navigator.pop(context);
            },
            child: const Text("حذف"),
          ),

        ],
      );
    },
  );
}

  // تعديل طالب
  void editStudent(int index) {
    TextEditingController editController =
        TextEditingController(text: students[index]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("تعديل الطالب"),
          content: TextField(
            controller: editController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "اسم الطالب الجديد",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("إلغاء"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  students[index] = editController.text;
                });
                Navigator.pop(context);
              },
              child: const Text("حفظ"),
            ),
          ],
        );
      },
    );
  }

  // نقل طالب
  void moveStudent(int index) {
    if (index < students.length - 1) {
      setState(() {
        var temp = students[index];
        students[index] = students[index + 1];
        students[index + 1] = temp;
      });
    }
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
              labelText: "اسم الطالب",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: addStudent,
            child: const Text("اضف طالب"),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(students[index]),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // تعديل
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => editStudent(index),
                        ),

                        // نقل
                        IconButton(
                          icon: const Icon(Icons.swap_vert,
                              color: Colors.orange),
                          onPressed: () => moveStudent(index),
                        ),

                        // حذف
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeStudent(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}