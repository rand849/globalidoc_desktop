import 'package:flutter/material.dart';
import 'package:globalidoc_desktop/datapull/database.manager.dart';
import 'package:globalidoc_desktop/info_show.dart';

// ignore: camel_case_types
class requestswdata extends StatefulWidget {
  const requestswdata({super.key});

  @override
  State<requestswdata> createState() => _requestswdataState();
}

// ignore: camel_case_types
class _requestswdataState extends State<requestswdata> {
  List dataList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey,
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
            }));
  }

  Widget buildItems(dataList) => ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: dataList.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const InfoShow(),
                  ));
                },
            leading:const Icon(Icons.person_rounded),
            title: Text(dataList[index]["email"]),
            subtitle: Text(dataList[index]["nationalty"]),
            trailing: Text(dataList[index]["document"],
                           style: const TextStyle(fontWeight:FontWeight.bold,
                           fontSize: 18),
          ));
        },
      );
}
