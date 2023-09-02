import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailSender extends StatefulWidget {
  const EmailSender({super.key});

  @override
  State<EmailSender> createState() => _EmailSenderState();
}

class _EmailSenderState extends State<EmailSender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.grey,
        elevation: 0,
      ),
      body: 
      Stack(children: [
       Container(
        height:300,
        width: 300,
        margin:const EdgeInsets.only(left: 100),
        child:const Image(image: AssetImage('images/person.png')),
       ),
         Align( alignment: Alignment.bottomRight,
           child: Container(
                      margin: const EdgeInsets.only(top: 10,right: 100,bottom: 30),
                      width: 130,
                      height: 80,
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow:const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 180, 180, 180),
                                  )
                                ]),
                            alignment: Alignment.center,
                            // ignore: sort_child_properties_last
                            child: Text(
                              "Send".tr,
                              style: GoogleFonts.robotoSerif(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            width: 100,
                            height: 50,
                          ),
                        ),
                        onTap: () async {
                          String? encodeQueryParameters(Map<String, String> params) {
                            return params.entries
                                .map((MapEntry<String, String> e) =>
                                    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                .join('&');
                                   }
                          final Uri emailUri= Uri(
                            scheme: 'mailto',
                            path:'rizkowesam@gmail.com',
                            query:encodeQueryParameters(<String, String>{
                              'subject':'IDENTITY CONFIRM',
                              'body':'Dear User \n  I hope this email finds you well please click on this url to verifiy your Identity \n Best Wishes GlobalIDoc Team  ',
                            })
                          );
                          if(await canLaunchUrl(emailUri)){
                            launchUrl(emailUri);
                          }else {
                            throw Exception('Could not launch $emailUri');
                          }
                        },
                      ),
                    ),
         ),
        ]));
  }
}