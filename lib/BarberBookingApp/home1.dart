import 'package:firebase/BarberBookingApp/helper.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Row(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Good Morning",style: TextStyle(color: Colors.white,fontSize: 31),),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Albert",style: Appwidget.bold(Colors.white, 31),),
          ),
          Divider(thickness: 5,),
          Text("Fresh Fades,Clean Curls",style: Appwidget.bold(Colors.white, 17),),
          Text("your Style,just one tap away",style: Appwidget.bold(Colors.white, 17),),
          SizedBox(height: 10,),

          Divider(thickness: 4,),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text("Services",style: Appwidget.bold(Colors.black, 31),),
                    SizedBox(height: 20,),
                    ListTile(
                        leading: Image.asset("assets/images/scissors.png",height: 200,width: 100,fit: BoxFit.contain,),
                        title: Text("Hair Cut",style: Appwidget.bold(Colors.black, 21),),
                        subtitle: Text("Take a great hair look and haircut"),
                      ),
                    Divider(thickness: 5,color: Colors.green,),
                    SizedBox(height: 40,),
                    ListTile(
                      leading: Image.asset("assets/images/razor.png",height: 100,width: 100,fit: BoxFit.contain,),
                      title: Text("Shaving",style: Appwidget.bold(Colors.black, 21),),
                      subtitle: Text("Take a great hair look and haircut"),
                    ),
                    Divider(thickness: 5,color: Colors.green,),
                    SizedBox(height: 40,),
                    ListTile(
                      leading: Image.asset("assets/images/lotion.png",height: 100,width: 100,fit: BoxFit.contain,),
                      title: Text("Cream Bath",style: Appwidget.bold(Colors.black, 21),),
                      subtitle: Text("Take a great hair look and haircut"),
                    ),
                    Divider(thickness: 5,color: Colors.green,),
                    SizedBox(height: 40,),
                    ListTile(
                      leading: Image.asset("assets/images/hair-color.png",height: 100,width: 100,fit: BoxFit.contain,),
                      title: Text("Hair Coloring",style: Appwidget.bold(Colors.black, 21),),
                      subtitle: Text("Take a great hair look and haircut"),
                    ),
                    Divider(thickness: 5,color: Colors.green,),
                    SizedBox(height: 30,),
                    Center(child: Text("Selct any of them",style: Appwidget.bold(Colors.orange, 21),)),
                    Center(child: Text("Barberbro2gmail.com",style: Appwidget.bold(Colors.black, 15),))
                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
