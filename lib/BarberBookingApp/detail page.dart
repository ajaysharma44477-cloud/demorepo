import 'dart:core';

import 'package:firebase/BarberBookingApp/helper.dart';
import 'package:flutter/material.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({super.key});

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  int selectda=0;
  int selecttime=0;
   final List<String>days=["Sun \n25","Mon \n 26","Wed\n28","Fri \n29"];
  final List<String>timeslots=[
    '09:00 AM', '10:00 AM', '11:00 AM',
    '12:00 PM', '01:00 PM', '02:00 PM',
    '03:00 PM', '04:00 PM', '05:00 PM',
    '06:00 PM', '07:00 PM', '08:00 PM',
    '09:00 PM','10:00 PM', '11:00 PM'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(radius: 35,backgroundImage: AssetImage("assets/images/barber1.png"),),
              title: Text("John doe",style: Appwidget.bold(Colors.white, 21),),
              subtitle: Text("BarberMan",style: Appwidget.bold(Colors.white, 15),),
            ),
            SizedBox(height: 20,),
            Align(alignment: Alignment.centerLeft,child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Choose your Slot",style: Appwidget.bold(Colors.white, 31),),
            )),
            SizedBox(height: 10,),
            SizedBox(
              height: 105,
              child: ListView.builder(
            scrollDirection: Axis.horizontal,itemCount:days.length,itemBuilder: (context,index){
        bool isselected=selectda==index;
                return Container(margin: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
        
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                    color: isselected?Colors.white:Colors.transparent,
                    border: Border.all(color: Colors.white,width: 2)
                  ),
                  child: Column(
                    children: [
                      Center(child: Text(days[index],style: Appwidget.bold(Colors.black, 17),))
                    ],
                  ),
                );
              }),
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.white,thickness: 4,),
            SizedBox(height: 600,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                 // borderRadius: BorderRadius.only(topLeft:Radius.circular(31),topRight: Radius.circular(31))
                ),
                child:  SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20,top: 20),
                            child: Text("Choose your Time",style: Appwidget.bold(Colors.black, 26),),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      SizedBox(height: 370,
                        child: GridView.builder(physics: NeverScrollableScrollPhysics(),itemCount: timeslots.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 2.0,crossAxisSpacing: 5,mainAxisSpacing: 5), itemBuilder: (context,index){
                          bool isseleceted=selecttime==index;
                          return Container(
                            height: 20,
                            width: 20,
                            margin: EdgeInsets.only(left: 10,top: 10),
                            decoration: BoxDecoration(
                              color: isseleceted?Colors.green.shade300:Colors.grey,
                              borderRadius: BorderRadius.circular(21),
                              border: Border.all(color: Colors.black)
                            ),
                            child: Center(child: Text(timeslots[index],style: Appwidget.bold(Colors.black, 21),)),
                          );
                        }),
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(21)
                        ),
                        child: Center(child: Text("Book Now",style: Appwidget.bold(Colors.white, 15),)),
                      )
                    ],
                  ),
                ) ,
        
              ),
            ),

        
          ],
        ),
      ),
    );
  }
}
