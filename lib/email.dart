import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailSender extends StatefulWidget {
  const EmailSender({super.key});

  @override
  State<EmailSender> createState() => _EmailSenderState();
}

class _EmailSenderState extends State<EmailSender> {
  var email;
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.grey,
        elevation: 0,
      ),
      body: 
      Stack(children: [
        Form(
          key: _formKey ,
          child: Column(children: [
            Container(
              height: 60,
              width: 300,
              margin: const EdgeInsets.only(top:400, left:850),
              child: TextFormField(
                controller: _emailController,
                onSaved: (text) {
                  email = text;
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
                  hintText: "Enter Subject",
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
              height: 60,
              width: 300,
              margin:const EdgeInsets.only(left:850),
              child: TextFormField(
                controller: _emailController,
                onSaved: (text) {
                  email = text;
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
                  hintText: "Enter email",
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
        
      ],),),
       Container(
        height:300,
        width: 300,
        margin:const EdgeInsets.only(left: 100),
        child:const Image(image: AssetImage('images/person.png')),
       ),
       Container(
          margin:const  EdgeInsets.only(top:550,left: 950),
           child: ElevatedButton(
            onPressed: () {
              
            },
            child: const Text("Send Email") ),
         ),
        ]));
  }
}