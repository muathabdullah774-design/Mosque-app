import 'package:flutter/material.dart';
class AppLayout {
  static List<String> titles = ["الصفحة الرئيسيه", "الحلقات", "الجلسات",
    "الطلاب", "التقارير"];

  static Widget? get drawer => null;

  static AppBar appBar(int index) {
    return AppBar(title: Text(titles[index]),backgroundColor: Colors.green, centerTitle: true,);
  }


  static BottomNavigationBar bottomNav(int currentIndex,
      Function(int)onTap,) {

    return BottomNavigationBar(backgroundColor: Colors.green,currentIndex: currentIndex,



      onTap: onTap ,type: BottomNavigationBarType.fixed,selectedItemColor: Colors.green
      ,unselectedItemColor: Colors.white,showSelectedLabels: false,showUnselectedLabels: false,items: [

        BottomNavigationBarItem(icon:_buildIcon (Icons.dashboard,currentIndex==0),label:"الصفحة الرئيسيه"),
        BottomNavigationBarItem(icon:_buildIcon (Icons.groups,currentIndex==1),label:"الحلقات"),
        BottomNavigationBarItem(icon:_buildIcon (Icons.menu_book,currentIndex==2),label:"الجلسات"),
        BottomNavigationBarItem(icon:_buildIcon  (Icons.book,currentIndex==3),label:"تسجيل طالب"),
        BottomNavigationBarItem(icon:_buildIcon  (Icons.bar_chart,currentIndex==4),label:"التقارير"),

      ],);}

  static Drawer appDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 49, 121, 49),
        child: ListView(
          children: [
  
            const DrawerHeader(
              child: Center(
                child: Text(
                  "ادارة المسجد",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
  
            drawerItem(
              context: context,
              icon: Icons.people,
              title: "المستخدمين",
              page:  const Users(),
            ),
  
            drawerItem(
              context: context,
              icon: Icons.settings,
              title: "الإعدادات",
              page: const Settings(),
            ),
  
            drawerItem(
              context: context,
              icon: Icons.info,
              title: "عن التطبيق",
              page: const About(),
            ),
  
          ],
        ),
      ),
    );
  }

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




class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text('المستخدمين')),
      body: Center(child: Text('المستخدمين')),
    );
  }
}





class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: const Center(child: Text('الإعدادات')),
    );
  }
}



class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('عن التطبيق')),
      body: const Center(child: Text('عن التطبيق')),
    );
  }
}