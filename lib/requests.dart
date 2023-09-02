import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalidoc_desktop/datapull/database.manager.dart';
import 'package:globalidoc_desktop/email.dart';
import 'Settings.dart';


// ignore: camel_case_types
class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

// ignore: camel_case_types
class _RequestsState extends State<Requests> {
  List dataList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SettingWidget() ,
        appBar: AppBar(
            backgroundColor:Colors.grey,
            title:  Text("req".tr),
            elevation: 0,
          ),
        body: FutureBuilder(
            future: FireStoreDatabase().getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Something Went Wrong");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                dataList = snapshot.data as List;
                return buildItems(dataList);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
            // floatingActionButton: FloatingActionButton(
            //   child: const Icon(Icons.search),
            //   onPressed: ()=>showSearch(context: context, delegate:MySearchDelgate()),),
            );
  }

  Widget buildItems(dataList) => ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: dataList.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(color: Color.fromARGB(255, 133, 204, 154),),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EmailSender(),
                  ));
                },
            leading:const Icon(Icons.person_rounded,
            color: Colors.grey,),
            title: Text(dataList[index]["idnumber"]),
            subtitle: Text(dataList[index]["nationality"]),
            trailing: Text(dataList[index]["document"],
                           style: const TextStyle(fontWeight:FontWeight.bold,
                           fontSize: 18),
          ));
        },
      );
}

