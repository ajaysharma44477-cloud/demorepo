import 'package:firebase/db12.dart';
import 'package:flutter/material.dart';

class Prac extends StatefulWidget {
  const Prac({super.key});

  @override
  State<Prac> createState() => _PracState();
}

class _PracState extends State<Prac> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(controller: namecontroller,
              decoration: InputDecoration(
                hintText: "name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                )
              ),
            ),
            SizedBox(height: 20,),
            TextField(controller: emailcontroller,
              decoration: InputDecoration(
                hintText: "email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  )
              ),
            ),
            ElevatedButton(onPressed: (){
              Dbdata db=Dbdata();
              String name=namecontroller.text;
              String email=emailcontroller.text;
        
              db.createdata(namecontroller.text,emailcontroller.text,"");
            }, child: Text("click"))
          ],
        ),
      ),
    );
  }
}
