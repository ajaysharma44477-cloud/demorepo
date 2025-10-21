import 'package:firebase/Auth/register%20page/Signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name="",email="",pass="";
  final _key=GlobalKey<FormState>();
  TextEditingController names=TextEditingController();
  TextEditingController emails=TextEditingController();
  TextEditingController passw=TextEditingController();

   register()async{
    if(passw!=null&&names!=""&&email!=""){
      try{
        UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered successfully")));
        Navigator.push(context,MaterialPageRoute(builder: (context)=> Signin()));
      }on FirebaseAuthException catch(e){
if(e.code=="weak-password"){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password is to weak")));
}else if(e.code=="email-already-in-use"){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Already in use")));
}
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sign up page"),centerTitle: true,),
      body: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              validator: (value){
                if(value==null||value.isEmpty){
                  return "please enter the valid email";
                }else if(!RegExp(r"^[a-z-AZ/s]+$").hasMatch(value)){
                  return "please enter the valid name";
                }
                return null;
              },
              controller: names,
              decoration: InputDecoration(
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21)
                ),
                labelText: "name"
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              validator: (value){
                if(value==null||value.isEmpty){
                 return "please fill the filed";
                }else if(!RegExp(r"^[a-z-AZ/s]+$").hasMatch(value)){
                  return "please enter the valid email";
                }
                return null;
              },
              controller:emails ,
              decoration: InputDecoration(
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                  ),labelText: "email"
              ),
            ),SizedBox(height: 20,),
            TextFormField(
              validator: (value){
                if(value==null||value.isEmpty){
                  return "please enter the valid email";

                }else if(!RegExp(r"^[a-z-AZ/s]+$").hasMatch(value)){
                  return "please enter the valid email";
                }
                return null;
              },
              controller: passw,
              decoration: InputDecoration(
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                  ),
                labelText: "pass"
              ),
            ),
            ElevatedButton(onPressed: (){
              if(_key.currentState!.validate()){
                setState(() {
                  name=names.text;
                  email=emails.text;
                  pass=passw.text;
                });
                register();
              }
            }, child: Text("submit"))

          ],
        ),
      ),
    );
  }
}
