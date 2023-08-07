import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDatabase {
  // ignore: non_constant_identifier_names
  List InfosList=[];
  final CollectionReference collectionReference=
    FirebaseFirestore.instance.collection("infos");

  Future getData() async{
    try { 
      await collectionReference.get().then((querySnapshot){
        for(var result in querySnapshot.docs){
          InfosList.add(result.data());
        }
      });
      return InfosList;
    }catch(e){
      // ignore: avoid_print
      print("Error - $e");
      // return null;
    }
  }
}