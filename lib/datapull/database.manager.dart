import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDatabase {
  // ignore: non_constant_identifier_names
  List RequestsList=[];
  final CollectionReference collectionReference=
    FirebaseFirestore.instance.collection("users");

  Future getData() async{
    try { 
      await collectionReference.get().then((querySnapshot){
        for(var result in querySnapshot.docs){
          RequestsList.add(result.data());
        }
      });
      return RequestsList;
    }catch(e){
      // ignore: avoid_print
      print("Error - $e");
      // return null;
    }
  }
}