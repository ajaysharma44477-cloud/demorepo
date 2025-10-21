import 'package:firebase/BarberBookingApp/helper.dart';
import 'package:firebase/BarberBookingApp/home1.dart';
import 'package:firebase/BarberBookingApp/onboarding.dart';
import 'package:firebase/practise.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();
  String email="",pass="";
  void login()async{
    if(email!=null&& pass!=null){
      try{
        UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login")));
        Navigator.push(context,MaterialPageRoute(builder: (context)=> Homepage()));
      }on FirebaseAuthException catch(e){
        if(e.code=="User-not-found"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("not found")));
        }else if(e.code=="Wrong password"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password")));
        }
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/bg.png",fit: BoxFit.cover,),),
          Positioned.fill(child: Container(child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              children: [
                SizedBox(height: 400,),
                Align(alignment: Alignment.centerLeft,child: Text("Welcome\n back",style: Appwidget.bold(Colors.white, 31)
                  ,)
                ),
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: Colors.grey
                  ),
                  child: TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.email)),
                      hintText: "Email",
                      border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.grey
                  ),
                  child: TextField(
                    controller: passcontroller,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.password)),
                        hintText: "Password",
                        border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Align(alignment: Alignment.centerRight,child: Text("Forgot Password?",style: Appwidget.bold(Colors.white, 15),)),
                InkWell(onTap: (){
                  setState(() {
                    email=emailcontroller.text;
                    pass=passcontroller.text;
                    login();
                  });
                },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Center(child: Text("Login",style: Appwidget.bold(Colors.white, 19),)),
                  ),
                )
              ],
            ),
          ),))
          
          
    
          
        ],
      ),
    );
  }
}
