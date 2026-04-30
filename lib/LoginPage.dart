import 'package:flutter/material.dart';
import 'package:mouque/MainPage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  State<Loginpage> createState()=> _Laginpage(); }

class _Laginpage extends State<Loginpage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(appBar: AppBar(backgroundColor: Colors.green,
        title: Text("تسجيل الدخول",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20),),),
        body:Column(children: [SizedBox(height: 70,),Icon(Icons.perm_identity_outlined,size: 70,color: Colors.green,),SizedBox(height: 70,),Container(
          child:Form(child: TextField(decoration: InputDecoration(labelText: "اسم المستخدم",suffixIcon: Icon(Icons.perm_contact_cal_outlined,color: Colors.green,)),)) ,),SizedBox(height: 40,),
          Container(child: TextField(decoration: InputDecoration(labelText: "كلمة المرور",suffixIcon: Icon(Icons.password,color: Colors.green)),)),
          SizedBox(height: 40,)
          ,MaterialButton(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
            onPressed:(){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>const Mainpage(),));
            }

            ,minWidth: 200,height: 50,color: Colors.green,child: Text("دخول",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white),),)
        ],),
      ),
    );
  }}
