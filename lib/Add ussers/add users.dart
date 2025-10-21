import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Database/Database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class Addusers extends StatefulWidget {
  const Addusers({super.key});

  @override
  State<Addusers> createState() => _AddusersState();
}

class _AddusersState extends State<Addusers> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();

  final dbrefrence=FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add",style: TextStyle(fontSize: 21),),centerTitle: true,
      ),
      body: Form(
        child: ListView(
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                  labelText: "enter your name"
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                  labelText: "enter your email"
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: 
              ElevatedButton(onPressed: ()
              async{
                String id=DateTime.now().millisecondsSinceEpoch.toString();
                await  dbrefrence.doc(id).set({
                  "id":id,
                  "name":name.text,
                  "email":email.text
                });
                Navigator.pop(context);
              }, child: Text("submit")
              ),
              // ElevatedButton(onPressed: ()async{
              //   String id=DateTime.now().millisecondsSinceEpoch.toString();
              //   if(name.text!=""&&email.text!=""){
              //     Map<String,dynamic>Studentmap= {
              //       "name": name.text,
              //       "email": email.text,
              //       "id": id
              //     };
              //     await DatabaseMethods1().addStudent(Studentmap, id).then((value){
              //       name.text="";
              //       email.text="";
              //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("uploaded")));
              //     });
              //
              //   }
              // }, child: Text("submit"))
            )
          ],
        ),
      ),
    );
  }
}
