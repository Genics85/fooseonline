import 'package:cloud_firestore/cloud_firestore.dart';

class OnlinePosts{

  Future size(String) async{
    FirebaseFirestore db =FirebaseFirestore.instance;
    CollectionReference collection=db.collection("cloths");
    QuerySnapshot snapshot= await collection.get();
    List<QueryDocumentSnapshot> list =snapshot.docs;
    DocumentSnapshot document=list[0];
    final id =document.id;
    return collection.doc(id);
  }


}