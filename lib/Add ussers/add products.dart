import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // Create (Add User)
  Future<void> addUser(String name, String email) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    await FirebaseFirestore.instance.collection("Users").doc(id).set({
      "id": id,
      "name": name,
      "email": email,
      "created_at": DateTime.now(),
    });
  }
  Future<void>updateuser(String name,String email,String docid)async{
    await FirebaseFirestore.instance.collection("Users").doc(docid).update({
      "name":name,
      "email":email
    });
  }
  Future<void>deleteuser(String docid)async{
    await FirebaseFirestore.instance.collection("Users").doc(docid).delete();
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Products"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: "Enter your name",
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: "Enter your email",
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (name.text.isNotEmpty && email.text.isNotEmpty) {
                  addUser(name.text, email.text);
                  name.clear();
                  email.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Uploaded successfully")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all fields")),
                  );
                }
              },
              child: const Text("Submit"),
            ),
            const Divider(height: 30),
            Expanded(
              // Read (Get Users)
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Users")
                    .orderBy("created_at", descending: true)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No users found"));
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
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
                                    title: Text("update"),
                                    content: Column(
                                      children: [
                                        TextField(controller: name,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(21)
                                          )
                                        ),),
                                        SizedBox(height: 10,),
                                        TextField(controller: email,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(21)
                                              )
                                          ),)

                                      ],
                                    ),actions: [
                                      TextButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Text("cancel")),
                                    ElevatedButton(onPressed: (){
                                      updateuser(name.text, email.text,data["id"]);
                                      name.clear();
                                      email.clear();
                                      Navigator.pop(context);
                                    }, child: Text("update"))
                                  ],
                                  );
                                });
                              }, icon: Icon(Icons.edit),),
                              IconButton(onPressed: (){
                                deleteuser(data["id"]);
                              }, icon: Icon(Icons.delete))

                            ],
                          )

                          

                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
