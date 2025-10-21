import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Column(
        children: [
          Image.asset("assets/images/barber.png"),
          SizedBox(height: 20,),
          Center(child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text("Barber appointment software that lets you do better at every stage of the customer’s journey",style: TextStyle(fontSize: 17,color: Colors.white),),
          )),
          SizedBox(height: 30,),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Text("Book Now",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)),
          )
        ],
      ),
    );
  }
}
