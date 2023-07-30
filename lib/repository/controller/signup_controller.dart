
import 'package:get/get.dart';

import '../../model/user.dart';
import '../userrepository.dart';


class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final userRepo = Get.put(UserRepository());

  Future<void> createUser(UserModel employee) async {
   await userRepo.createUser(employee);
  }
}