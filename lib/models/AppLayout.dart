import 'package:flutter/material.dart';
class AppLayout {
  static List<String> titles = ["Home", "Circles", "Session",
    "Student", "Reports"];

  static AppBar appBar(int index) {
    return AppBar(title: Text(titles[index]),backgroundColor: Colors.green, centerTitle: true,);
  }


  static BottomNavigationBar bottomNav(int currentIndex,
      Function(int)onTap,) {

    return BottomNavigationBar(backgroundColor: Colors.green,currentIndex: currentIndex,



      onTap: onTap ,type: BottomNavigationBarType.fixed,selectedItemColor: Colors.green
      ,unselectedItemColor: Colors.white,showSelectedLabels: false,showUnselectedLabels: false,items: [

        BottomNavigationBarItem(icon:_buildIcon (Icons.dashboard,currentIndex==0),label:"Home"),
        BottomNavigationBarItem(icon:_buildIcon (Icons.groups,currentIndex==1),label:"Circles"),
        BottomNavigationBarItem(icon:_buildIcon (Icons.menu_book,currentIndex==2),label:"Session"),
        BottomNavigationBarItem(icon:_buildIcon  (Icons.book,currentIndex==3),label:"Student"),
        BottomNavigationBarItem(icon:_buildIcon  (Icons.bar_chart,currentIndex==4),label:"Reports"),

      ],);}

  // static Drawer appDrawer(BuildContext context) {
  //   return Drawer(
  //     child: Container(
  //       color: Colors.green,
  //       child: ListView(
  //         children: [
  //
  //           const DrawerHeader(
  //             child: Center(
  //               child: Text(
  //                 "Mosque Manager",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 22,
  //                 ),
  //               ),
  //             ),
  //           ),
  //
  //           drawerItem(
  //             context: context,
  //             icon: Icons.people,
  //             title: "Users",
  //             page: const Users(),
  //           ),
  //
  //           drawerItem(
  //             context: context,
  //             icon: Icons.settings,
  //             title: "Settings",
  //             page: const Settings(),
  //           ),
  //
  //           drawerItem(
  //             context: context,
  //             icon: Icons.info,
  //             title: "About App",
  //             page: const About(),
  //           ),
  //
  //         ],
  //       ),
  //     ),
  //   );
  // }

  static Widget drawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Widget page,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => page,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [

            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.green,
              ),
            ),

            const SizedBox(width: 15),

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),

          ],
        ),
      ),
    );
  }

  static Widget _buildIcon(IconData icon,bool selected){
    return Container(padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: selected ?Colors.white :Colors.transparent,
          shape:BoxShape.circle ),

      child:Icon (icon,color: selected? Colors.green:Colors.white,) ,
    );
  }


  static void changPage(BuildContext context,int index,Function(int)setIndex,){
    setIndex(index);
    Navigator.pop(context);
  }



}



