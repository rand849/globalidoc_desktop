import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalidoc_desktop/infopull/data_manager.dart';


// ignore: camel_case_types
class InfoShow extends StatefulWidget {
  const InfoShow({super.key});

  @override
  State<InfoShow> createState() => _InfoShowState();
}

// ignore: camel_case_types
class _InfoShowState extends State<InfoShow> {
  List dataList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: const SettingWidget() ,
        appBar: AppBar(
            backgroundColor:Colors.grey,
            title:  Text("cus".tr),
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
            // onTap: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const InfoShow(),
            //       ));
            //     },
            leading:const Icon(Icons.person_rounded,
            color: Colors.grey,),
            title: Text(dataList[index]["name"]),
            subtitle: Text(dataList[index]["city"]),
            trailing: Text(dataList[index]["email"],
                           style: const TextStyle(fontWeight:FontWeight.bold,
                           fontSize: 18),
          ));
        },
      );
}

