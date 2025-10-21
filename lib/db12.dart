import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

class Dbdata{
  final CollectionReference objdata=FirebaseFirestore.instance.collection("demo info");
  Future<void>createdata(
      String name,String email,String id)async {
    String id=randomAlphaNumeric(10);
    objdata.add({
      "name":name,
      "email":email,
      "id":id
    });
  }
}