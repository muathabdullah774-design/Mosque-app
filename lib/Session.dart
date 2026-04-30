// import 'package:flutter/material.dart';
//
// class Session extends StatefulWidget {
//   const Session({super.key});
//
//   @override
//   State<Session> createState() => _SessionState();
// }
//
// class _SessionState extends State<Session> {
//
//   List students = [
//     "Ahmed",
//     "Mohammed",
//     "Ali"
//   ];
//
//   Map studentData = {};
//
//   List surahs = [
//     "Al-Fatiha",
//     "Al-Baqarah",
//     "Aal-E-Imran",
//     "An-Nisa",
//     "Al-Ma'idah",
//     "Al-An'am",
//     "Al-A'raf",
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//
//     for (var s in students) {
//       studentData[s] = {
//         "present": true,
//         "surah": "",
//         "from": "",
//         "to": "",
//         "rating": 3
//       };
//     }
//   }
//
//  // void chooseSurah(String student) async {
//  //
//  //    String? result = await showSearch(
//  //      context: context,
//  //      delegate: SurahSearch(surahs),
//  //    );
//  //
//  //    if(result != null){
//  //      setState(() {
//  //        studentData[student]["surah"] = result;
//  //      });
//  //    }
//  //
//  //  }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return ListView.builder(
//
//       padding: const EdgeInsets.all(12),
//
//       itemCount: students.length,
//
//       itemBuilder: (context,index){
//
//         String student = students[index];
//
//         return Card(
//
//           elevation: 3,
//
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12)
//           ),
//
//           child: Padding(
//
//             padding: const EdgeInsets.all(12),
//
//             child: Column(
//
//               crossAxisAlignment: CrossAxisAlignment.start,
//
//               children: [
//
//                 /// اسم الطالب
//                 Text(
//                   student,
//                   style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold
//                   ),
//                 ),
//
//                 const SizedBox(height:10),
//
//                 /// الحضور
//                 Row(
//
//                   children: [
//
//                     Checkbox(
//
//                       value: studentData[student]["present"],
//
//                       onChanged: (v){
//
//                         setState(() {
//                           studentData[student]["present"] = v;
//                         });
//
//                       },
//
//                     ),
//
//                     const Text("Present")
//
//                   ],
//
//                 ),
//
//                 const SizedBox(height:10),
//
//                 /// اختيار السورة
//                 ListTile(
//
//                   title: const Text("Surah"),
//
//                   subtitle: Text(
//                       studentData[student]["surah"] == ""
//                           ? "Choose Surah"
//                           : studentData[student]["surah"]
//                   ),
//
//                   trailing: const Icon(Icons.search),
//
//                   onTap: (){
//                     chooseSurah(student);
//                   },
//
//                 ),
//
//                 const SizedBox(height:10),
//
//                 /// الايات
//                 Row(
//
//                   children: [
//
//                     Expanded(
//
//                       child: TextField(
//
//                         decoration: const InputDecoration(
//                             labelText: "From Ayah"
//                         ),
//
//                         onChanged: (v){
//                           studentData[student]["from"] = v;
//                         },
//
//                       ),
//
//                     ),
//
//                     const SizedBox(width:10),
//
//                     Expanded(
//
//                       child: TextField(
//
//                         decoration: const InputDecoration(
//                             labelText: "To Ayah"
//                         ),
//
//                         onChanged: (v){
//                           studentData[student]["to"] = v;
//                         },
//
//                       ),
//
//                     ),
//
//                   ],
//
//                 ),
//
//                 const SizedBox(height:10),
//
//                 /// التقييم
//                 DropdownButtonFormField(
//
//                   value: studentData[student]["rating"],
//
//                   decoration: const InputDecoration(
//                       labelText: "Rating"
//                   ),
//
//                   items: [1,2,3,4,5].map((e){
//
//                     return DropdownMenuItem(
//                       value: e,
//                       child: Text("$e"),
//                     );
//
//                   }).toList(),
//
//                   onChanged: (v){
//
//                     setState(() {
//                       studentData[student]["rating"] = v;
//                     });
//
//                   },
//
//                 )
//
//               ],
//
//             ),
//
//           ),
//
//         );
//
//       },
//
//     );
//
//   }
//
// }
//
// /// البحث عن السورة
// class SurahSearch extends SearchDelegate {
//
//   final List surahs;
//
//   SurahSearch(this.surahs);
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: (){
//           query="";
//         },
//       )
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: (){
//         close(context,null);
//       },
//     );
//
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//
//     final results = surahs.where((s){
//       return s.toLowerCase().contains(query.toLowerCase());
//     }).toList();
//
//     return ListView(
//
//       children: results.map((e){
//
//         return ListTile(
//
//           title: Text(e),
//
//           onTap: (){
//             close(context,e);
//           },
//
//         );
//
//       }).toList(),
//
//     );
//
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//
//     return buildResults(context);
//
//   }
//
// }