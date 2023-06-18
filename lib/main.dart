import 'package:flutter/material.dart';
import 'package:firedart/firedart.dart';
import 'package:globalidoc_desktop/requests.dart';


const apiKey='AIzaSyCWJ_QgwLD7BwUd3vwHs0Atwu9ViqaMP8E';
const projectID='globalidoc-cd69a';
void main() async {
  Firestore.initialize(projectID);
  runApp( const GlobalIDoc());
}

  

class GlobalIDoc extends StatefulWidget {
  const GlobalIDoc({super.key});

  @override
  State<GlobalIDoc> createState() => _GlobalIDocState();
}

class _GlobalIDocState extends State<GlobalIDoc> {
  CollectionReference employeeNameCollection  = Firestore.instance.collection('employeename ');
  
  var password;

  var username;

  final TextEditingController textEditingController = TextEditingController();

  GlobalKey<FormFieldState> FormF =  GlobalKey<FormFieldState>();

  GlobalKey<FormFieldState> FormB =  GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
           body: 
          Stack(
            children:[
          Container(
            height: double.infinity,
            width:double.infinity,
            decoration:const BoxDecoration( 
              image:DecorationImage(
              image:AssetImage('images/signin.jpg'),
              fit: BoxFit.fill,
              ),
          ),),   
          Form(
                        key: FormF,
                        child: Column(
                          children: [

                           Container(
                              margin: const EdgeInsets.only(left:320,top:250),
                              child: const Text("Employee Name:",
                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 24,
                              fontStyle: FontStyle.italic,
                             ),)
                            ),
                            Container(
                              height:60,
                              width:300,
                              margin: const EdgeInsets.only(top:25,left:350),
                              child: TextFormField(
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
                                  hintText: "your username",
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                  filled: true,
                                  fillColor:
                                     const Color.fromARGB(255, 109, 109, 109),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      )),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left:320,top:50),
                              child: const Text("Password :",
                             style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 24,
                              fontStyle: FontStyle.italic,
                             ),)
                            ),
                                 Container(
                              height:60,
                              width:300,
                              margin: const EdgeInsets.only(top:20,left:350),
                              child: TextFormField(
                                onSaved: (text) {
                                  username = text;
                                },
                                style: const TextStyle(fontSize: 15),
                                textInputAction: TextInputAction.next,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.visiblePassword,
                                minLines: 1,
                                maxLines: 2,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  prefixIconColor: (Colors.black),
                                  hintText: "your username",
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                  filled: true,
                                  fillColor:
                                     const Color.fromARGB(255, 109, 109, 109),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      )),
                                ),
                              ),
                            ),
                 Container(
                       width: 105,
                        height:50,
                        margin: const EdgeInsets.only(
                                left:860, right: 37, top: 100,),
                        decoration: BoxDecoration(
                             border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width:2,
                             ),
                             borderRadius: BorderRadius.circular(40),
                             boxShadow: const [
                              BoxShadow(
                              blurRadius: 1,
                              color: Color.fromARGB(255, 92, 92, 92),
                              )]
                         ),
                          padding: const EdgeInsets.fromLTRB(12,5,0,0),
                        child: InkWell(
                          child: const Text(
                            "Sign in ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 24,
                            ),
                          ),
                          onTap: () async { 
                            final employeename = await employeeNameCollection.get();
                            print('object');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const requests()));   
                          },
                        ),
                        ),
            ]),
          ),]
    ),));
      }
}
