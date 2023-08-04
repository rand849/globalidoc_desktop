import 'package:flutter/material.dart';
import 'package:globalidoc_desktop/customers.dart';

class requests extends StatelessWidget {
  const requests({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey,
            elevation: 0,
          ),
        // body: Stack(
        //   children: [
        //    Container(
        //     child:const ListTile(
        //         leading: Icon(Icons.person),
        //         title: Text("000040406380"),
        //         subtitle: Text("Lebanon"),
        //         trailing: Text("High School Diploma",
        //         style: TextStyle(fontWeight:FontWeight.bold,
        //         fontSize: 18),
        //         ),
        //         isThreeLine: true,
        //       ),
        //    ),
        //    Container(
        //     margin: const  EdgeInsets.only(top:45),
        //     child: const Divider(
        //       color: Colors.grey,
        //     ),
        //    ),
        //    Container(
        //     child:const ListTile(
        //         leading: Icon(Icons.person),
        //         title: Text("10170025378"),
        //         subtitle: Text("Syria"),
        //         trailing: Text("Middle School Diploma",
        //         style: TextStyle(fontWeight:FontWeight.bold,
        //         fontSize: 18),
        //         ),
        //         isThreeLine: true,
        //       ), 
        //    ),
        //   Container(
        //     margin: const  EdgeInsets.only(top:45),
        //     child: const Divider(
        //       color: Colors.grey,
        //     ),
        //    ),
        // ]),
        body: ListView.separated(itemBuilder: (context,index){
          return ListTile(
                leading:const Icon(Icons.person),
                // title: Text(customer[index].id),
                subtitle: Text(customer[index].nationalty),
                trailing: Text(customer[index].document,
                style: const TextStyle(fontWeight:FontWeight.bold,
                fontSize: 18),
                ),
                isThreeLine: true,
          );
        },
        itemCount: customer.length,
        separatorBuilder: (context,index){
          return const Divider(
            color: Colors.grey,
            thickness: 1,);
        },
      ),);
    });
  }
}
