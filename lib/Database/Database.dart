import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods1 {
  Future addStudent(Map<String, dynamic> studentinfo, String id) async {
    return await FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .set(studentinfo);
  }
}
