import 'package:flutter/material.dart';
import 'package:globalidoc_desktop/datapull/database.manager.dart';

// ignore: camel_case_types
class requests extends StatefulWidget {
  const requests({super.key});

  @override
  State<requests> createState() => _requestsState();
}

// ignore: camel_case_types
class _requestsState extends State<requests> {
  List dataList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation:0
        ),
      body: FutureBuilder(
        future: FireStoreDatabase().getData(),
        builder:(context,snapshot){
         if (snapshot.hasError){
          return const Text("Something Went Wrong");
         }
         if (snapshot.connectionState==ConnectionState.done){
          dataList =snapshot.data as List ;
          return buildItems(dataList);
         }
        return const Center(
          child: CircularProgressIndicator(),
        );
        } )
    );
  }

  Widget buildItems(dataList) => ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: dataList.length,
    separatorBuilder: (BuildContext context , int index)=> const Divider(),
    itemBuilder: (BuildContext context ,int index){
      return ListTile(
        title: Text(
          dataList[index]["idnumber"]
        ),
        subtitle: Text(
          dataList[index]["nationalty"]
        ),
        trailing: Text(
          dataList[index]["document"]
        ),
      );
    },
  );
}