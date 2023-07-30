// ignore_for_file: non_constant_identifier_names, unused_label

class UserModel {
   final String password;
   final String username;


   const  UserModel (
    {
    required this.password, 
    required this.username , 
});

    Map <String,dynamic> toJson(){
    return {
      'password':password,
      'username' : username,
    };
  }
    UserModel.fromjson(Map <String ,dynamic> data, this.username, this.password,){
    // ignore: unnecessary_null_comparison
      if(data == null){
        return;
      }
    password :data ['password'];
    username :data ['username']; 
   }
}