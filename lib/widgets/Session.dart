import 'package:flutter/material.dart';

class Session extends StatefulWidget {
  const Session({super.key});

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {

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
  ];

  Map studentData = {};

  List surahs = [
    "الفاتحة-",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الانعام",
    "الاعراف",
  ];

  @override
  void initState() {
    super.initState();

    for (var s in students) {
      studentData[s] = {
        "حاضر": true,
        "بحث": "",
        "من": "",
        "الى": "",
        "التقييم": 3
      };
    }
  }

 // void chooseSurah(String student) async {
 //
 //    String? result = await showSearch(
 //      context: context,
 //      delegate: SurahSearch(surahs),
 //    );
 //
 //    if(result != null){
 //      setState(() {
 //        studentData[student]["surah"] = result;
 //      });
 //    }
 //
 //  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(

      padding: const EdgeInsets.all(12),

      itemCount: students.length,

      itemBuilder: (context,index){

        String student = students[index];

        return Card(

          elevation: 3,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),

          child: Padding(

            padding: const EdgeInsets.all(12),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                /// اسم الطالب
                Text(
                  student,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height:10),

                /// الحضور
                Row(

                  children: [

                    Checkbox(

                      value: studentData[student]["حاضر"],

                      onChanged: (v){

                        setState(() {
                          studentData[student]["حاضر"] = v;
                        });

                      },

                    ),

                    const Text("حاضر")

                  ],

                ),

                const SizedBox(height:10),

                /// اختيار السورة
                ListTile(

                  title: const Text("بحث"),

                  subtitle: Text(
                      studentData[student]["بحث"] == ""
                          ? "Choose Surah"
                          : studentData[student]["بحث"]
                  ),

                  trailing: const Icon(Icons.search),

                  onTap: (){
                    chooseSurah(student);
                  },

                ),

                const SizedBox(height:10),

                /// الايات
                Row(

                  children: [

                    Expanded(

                      child: TextField(

                        decoration: const InputDecoration(
                            labelText: "من ايه"
                        ),

                        onChanged: (v){
                          studentData[student]["من"] = v;
                        },

                      ),

                    ),

                    const SizedBox(width:10),

                    Expanded(

                      child: TextField(

                        decoration: const InputDecoration(
                            labelText: "الى ايه"
                        ),

                        onChanged: (v){
                          studentData[student]["الى"] = v;
                        },

                      ),

                    ),

                  ],

                ),

                const SizedBox(height:10),

                /// التقييم
                DropdownButtonFormField(

                  value: studentData[student]["التقييم"],

                  decoration: const InputDecoration(
                      labelText: "التقييم"
                  ),

                  items: [1,2,3,4,5].map((e){

                    return DropdownMenuItem(
                      value: e,
                      child: Text("$e"),
                    );

                  }).toList(),

                  onChanged: (v){

                    setState(() {
                      studentData[student]["التقييم"] = v;
                    });

                  },

                )

              ],

            ),

          ),

        );

      },

    );

  }
  
  void chooseSurah(String student) {}

}

/// البحث عن السورة
class SurahSearch extends SearchDelegate {

  final List surahs;

  SurahSearch(this.surahs);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: (){
          query="";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {

    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: (){
        close(context,null);
      },
    );

  }

  @override
  Widget buildResults(BuildContext context) {

    final results = surahs.where((s){
      return s.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView(

      children: results.map((e){

        return ListTile(

          title: Text(e),

          onTap: (){
            close(context,e);
          },

        );

      }).toList(),

    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return buildResults(context);

  }

}