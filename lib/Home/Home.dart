import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Add%20ussers/add%20users.dart';
import 'package:flutter/material.dart';

class Homebro extends StatefulWidget {
  const Homebro({super.key});

  @override
  State<Homebro> createState() => _HomebroState();
}

class _HomebroState extends State<Homebro> {
  final dbrefrence=FirebaseFirestore.instance.collection("users");
  List<Map<String,dynamic>>users=[];

  void fetchdata()async{
    users.clear();
    final data=await dbrefrence.get();
    setState(() {
      for(var doc in data.docs){
        users.add(doc.data());
      }
    });

  }
  @override
  void initState() {
    fetchdata();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database",style: TextStyle(fontSize: 21),),centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=> Addusers()));
      },child: Icon(Icons.add,color: Colors.blue,),),
      body: ListView(
        children: [
          for(var user in users)
            ListTile(
              title: Text(user["name"]),
              subtitle: Text(user["email"]),
              trailing: IconButton(onPressed: ()async{
              await  dbrefrence.doc(user['id']).delete();
              fetchdata();
              }, icon: Icon(Icons.delete)),
            )
        ],
      ),
    );
  }
}
