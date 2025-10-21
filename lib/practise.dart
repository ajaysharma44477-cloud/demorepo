import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Practise extends StatefulWidget {
  const Practise({super.key});

  @override
  State<Practise> createState() => _PractiseState();
}

class _PractiseState extends State<Practise> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  Future<void> adduser(String name, String email) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    await FirebaseFirestore.instance.collection("info").doc(id).set(
        {"name": name, "email": email, "created at": DateTime.now(), "id": id});
  }
  Future<void>update(String id,String name,String email)async{
    await FirebaseFirestore.instance.collection("info").doc(id).update({
      "name":name,
      "email":email,
    });
  }
  Future<void>delete(
      String id
      )async{
    FirebaseFirestore.instance.collection("info").doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21))),
          ),
          ElevatedButton(
              onPressed: () {
                if (name.text.isNotEmpty && email.text.isNotEmpty) {
                  adduser(name.text, email.text);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("updated")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("pleade fill the details")));
                }
              },
              child: Text("submit")),
          Divider(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("info")
                    .orderBy("created at", descending: true)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else if (snapshot.data!.docs.isEmpty) {
                    return Text("no user records");
                  }
                  return ListView.builder(itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(data["name"][0]),
                      ),
                      title: Text(data["name"]),
                      subtitle: Text(data["email"]),
                      trailing: Row(mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: (){
                            showDialog(context: context, builder: (BuildContext context){
                              return AlertDialog(
                                title: Text("hello"),
                                content: Column(
                                  children: [
                                    TextField(
                                    controller: name,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(21)
                                      )
                                    ),
                                  ),
                                    SizedBox(height: 20,),
                                    TextField(
                                      controller: email,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(21)
                                          )
                                      ),
                                    ),
                                  ],
                                ),actions: [
                                  TextButton(onPressed: (){}, child: Text("cancel")),
                                ElevatedButton(onPressed: (){
                                  update(data["id"], name.text, email.text);
                                  name.clear();
                                  email.clear();
                                  Navigator.pop(context);
                                }, child: Text("ok"))
                              ],
                              );
                            });
                          }, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){
                            delete(data["id"]);
                          }, icon: Icon(Icons.delete))
                        ],

                      ),
                    );
                  },itemCount: snapshot.data!.docs.length,);
                }),
          )
        ],
      ),
    );
  }
}
