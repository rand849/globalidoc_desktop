// ignore_for_file: prefer_typing_uninitialized_variables, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalidoc_desktop/repository/userrepository.dart';
import 'package:globalidoc_desktop/requests.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalIDoc extends StatefulWidget {
  const GlobalIDoc({super.key});

  @override
  State<GlobalIDoc> createState() => _GlobalIDocState();
}

class _GlobalIDocState extends State<GlobalIDoc> {
  var password;
  var _obscureText;
  var username;
  var search;

  final List locale=[
    {'name':'English','locale': const Locale('en','US')},
    {'name':'العربية','locale': const Locale('ar','lb')},
  ];
  updatelanguage(Locale locale){
   Get.back();
   Get.updateLocale(locale);
  }
  builddialoug(BuildContext context){
    showDialog
    (context: context,
     builder: (builder){
      return AlertDialog(
        title: Text("lang".tr),
        content: Container(
          width:double.maxFinite,
          child:ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap:() {
                   // ignore: avoid_print
                   print(locale[index]['name']);
                   updatelanguage(locale[index]['locale']);
                  },
                  child: Text(
                    locale[index]['name']
                    ),
                ),
              );
            },
             separatorBuilder: (context,index){
              return const Divider(
                color: Colors.green,
              );
             },
              itemCount:locale.length)
        ),
      );
     });
  }

  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final userRepo = Get.put(UserRepository());
  final _formfield = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  @override
  void dispose() {
    _passController.dispose();
    _userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/signin.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Form(
          key: _formfield,
          child: Column(children: [
            Container(
                margin: const EdgeInsets.only(left: 420, top: 250),
                child: Text(
                  "emp".tr,
                  style: GoogleFonts.robotoSerif(
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    fontSize: 24,
                  ),
                )),
            Container(
              height: 60,
              width: 300,
              margin: const EdgeInsets.only(top: 25, left: 520),
              child: TextFormField(
                controller: _userController,
                onSaved: (text) {
                  username = text;
                },
                style: const TextStyle(fontSize: 15),
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.emailAddress,
                minLines: 1,
                maxLines: 2,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  prefixIconColor: (Colors.black),
                  hintText: "name".tr,
                  hintStyle: GoogleFonts.robotoSerif(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 209, 209, 209),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 2,
                      )),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 350, top: 30),
                child: Text(
                  "pass".tr,
                  style: GoogleFonts.robotoSerif(
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    fontSize: 24,
                  ),
                )),
            Container(
              height: 60,
              width: 300,
              margin: const EdgeInsets.only(top: 20, left: 520),
              child: TextFormField(
                controller: _passController,
                obscureText: !_obscureText,
                onSaved: (text) {
                  username = text;
                },
                style: const TextStyle(fontSize: 15),
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.visiblePassword,
                minLines: 1,
                maxLines: 1,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                    icon: _obscureText
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  prefixIconColor: (Colors.black),
                  hintText: "pass".tr,
                  hintStyle: GoogleFonts.robotoSerif(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 209, 209, 209),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 2,
                      )),
                ),
              ),
            ),
            Container(
              width: 105,
              height: 50,
              margin: const EdgeInsets.only(left: 570, right: 37, top: 20),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 1,
                      color: Color.fromARGB(255, 92, 92, 92),
                    )
                  ]),
              padding: const EdgeInsets.fromLTRB(10, 7, 2, 0),
              child: InkWell(
                child: Text(
                  "sign".tr,
                  style: GoogleFonts.robotoSerif(
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  // if (formKey.currentState!.validate()) {
                  //   final employee = UserModel(
                  //     password: _passController.text.trim(),
                  //     username: _userController.text.trim(),
                  //   );
                  //   SignUpController.instance.createUser(employee);
                  // }
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Requests(),
                  ));
                },
              ),
            ),

          ]),
          
        ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Align(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(onPressed: (){
                                     builddialoug(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                    backgroundColor:const Color.fromARGB(255, 209, 209, 209),
                                    textStyle: GoogleFonts.robotoSerif(
                                      fontSize: 18,
                                    )
                        ),
                                    icon:const Icon(Icons.language,
                                    color:Color.fromARGB(255, 76, 117, 88) ,),),
                                ),
                    )
      ]),
    );
  }
}
