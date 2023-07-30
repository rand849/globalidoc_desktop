import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user.dart';


class AuthRepository {
  static Future addUser(UserModel employee) async {
    User? currentEmployee = FirebaseAuth.instance.currentUser;
    if (currentEmployee != null) {
      await FirebaseFirestore.instance
          .collection('employee')
          .doc(currentEmployee.uid)
          .set(employee.toJson());
    }
  }
}
