import 'package:firebase/Add%20ussers/add%20products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String email="",pass="";
  final keys=GlobalKey<FormState>();
  TextEditingController emailcontroller=new TextEditingController();
  TextEditingController passcontroller=new TextEditingController();

  login()async{
    try{
      UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered successfully")));
      Navigator.push(context,MaterialPageRoute(builder: (context)=> Products()));
    }on FirebaseAuthException catch(e){
      if(e.code=="weak password"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password is to weak")));
      }else if(e.code=="email-already-inuse"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Already in use")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sign up page"),centerTitle: true,),
      body: Form(
        key: keys,
        child: Column(
          children: [
            TextFormField(
              validator: (value){
                if(value==null||value.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("pleae enter the details")));
                }else if(!RegExp(r"^[a-z-AZ/s]+$").hasMatch(value)){
                  return "please enter the valid name";
                }
                return null;
              },
              controller: emailcontroller,
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("pleae enter the details")));
                }else if(!RegExp(r"^[a-z-AZ/s]+$").hasMatch(value)){
                  return "please enter the valid email";
                }
                return null;
              },
              controller:passcontroller ,
              decoration: InputDecoration(
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                  ),labelText: "email"
              ),
            ),SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              if(keys.currentState!.validate()){
                setState(() {

                  email=emailcontroller.text;
                  pass=passcontroller.text;
                });
              login();
              }
            }, child: Text("submit"))

          ],
        ),
      ),
    );
  }
}
