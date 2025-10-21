import 'package:firebase/BarberBookingApp/database/database.dart';
import 'package:firebase/BarberBookingApp/helper.dart';
import 'package:firebase/BarberBookingApp/login.dart';
import 'package:firebase/BarberBookingApp/shared%20prefrence/shared%20preference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();
  TextEditingController confirmcontroller=TextEditingController();
  String name="",pass="",email="";
  Dbmethods firedata=Dbmethods();
  SharedPrefrenceHelper sphelp=SharedPrefrenceHelper();

  void register() async {
    if (pass != null && name != null && email != null) {
      try {
        // 1. Create user in Firebase Auth
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);

        // 2. Add user to Firestore and wait for completion
        await firedata.adduser(namecontroller.text, emailcontroller.text, passcontroller.text);

        await sphelp.saveusername(namecontroller.text);
        await sphelp.saveemail(emailcontroller.text);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registered successfully")),
        );

        // 3. Navigate after Firestore write completes
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Registerpage()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Weak Password")));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Email Already in use")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${e.code}")));
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 10),
              child: Align(alignment:Alignment.centerLeft,child: Text("Hello...!",style: Appwidget.bold(Colors.white, 36),)),
            ),
            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.grey
              ),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                    prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                    hintText: "Name",
                    border: InputBorder.none
                ),
              ),
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
            SizedBox(height: 30,),
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
            SizedBox(height: 30,),
            InkWell(onTap: (){
              setState(() {
                name=namecontroller.text;
                email=emailcontroller.text;
                pass=passcontroller.text;

                register();
              });
            },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(31)
                ),
                child: Center(child: Text("Sign up",style: Appwidget.bold(Colors.white, 15),)),
              ),
            ),
            SizedBox(height: 50,),
            ClipRRect(borderRadius: BorderRadius.circular(21),child: Image.asset("assets/images/barber.png",height: 300,width: 500,fit: BoxFit.cover,))
          ],
        ),
      ),
    );
  }
}
