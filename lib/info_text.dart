import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalidoc_desktop/infopull/data_manager.dart';

class InfoText extends StatefulWidget {
  const InfoText({super.key});

  @override
  State<InfoText> createState() => _InfoTextState();
}

class _InfoTextState extends State<InfoText> {
  List dataList=[];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: const SettingWidget() ,
        appBar: AppBar(
            backgroundColor:Colors.grey,
            title:  Text("cus".tr),
            elevation: 0,
          ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("infos").snapshots(),
            builder: (context, snapshot) {
              List<Row> customerinfos=[];
              if(snapshot.hasData){
                final info=snapshot.data?.docs.reversed.toList();
                for(var infos in info!  ){
                 final clientWidget=Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(infos["name"]),
                    Text(infos["email"]),
                    Text(infos["city"]),
                    Text(infos["document"]),
                    Text(infos["nationality"]),
                    // Text(infos["city"]),
                  ],);
                  customerinfos.add(clientWidget);
                }
              }

              return Expanded(
                child: ListView(
                  children: customerinfos,
                ),
              );
              // if (snapshot.hasError) {
              //   return const Text("Something Went Wrong");
              // }
              // if (snapshot.connectionState == ConnectionState.done) {
              //   dataList = snapshot.data as List;
              //   return buildItems(dataList);
              // }
              // return const Center(
              //   child: CircularProgressIndicator(),
              // );
            }),
            );
  }
  // Widget buildItems(dataList){
  //   return LayoutBuilder(
  //     builder: (context,index) {
  //       return Stack(
  //         children: [
  //           Column(
  //             children: [
  //               Container(
  //                 child: Text(dataList[index]["name"]),
  //               ),
  //             ],
  //           )
  //         ],
  //       );
  //     }
  //   ) ;
  // }
}