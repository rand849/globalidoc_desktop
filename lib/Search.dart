// // ignore_for_file: file_names, unnecessary_null_comparison

// import 'package:flutter/material.dart';

// class MySearchDelgate extends SearchDelegate{
//   List<String> data=[];
//       List<String> suggestions=[
//        'High School Diploma',
//        "Middle School Diploma",
//        'Individual Civil Registry Record',
//        'Family Civil Registry Record'
//     ];
//   @override
//   Widget? buildLeading(BuildContext context)=> IconButton(onPressed: ()=>close(context,null), 
//   icon:const Icon(Icons.arrow_back));
//   @override
//   List<Widget>? buildActions(BuildContext context)=> [
//     IconButton(onPressed: (){
//       if(query.isEmpty){
//         close(context,null);
//       } 
//       else{
//         query="";
//       }},
//      icon: const Icon(Icons.clear))
//   ];
//   @override
//   Widget buildResults(BuildContext context){
//      if(query != null && data.contains(query.toLowerCase())){
//       return ListTile(
//         title: Text(query),
//         onTap: (){},
//       );
//      }
//      else if(query==""){
//       return const Text("");
//      }
//      else {
//      return ListTile(
//       title: const Text("No result found"),
//       onTap: (){},
//      );}
//   }
//   @override
//   Widget buildSuggestions(BuildContext context){

//     // searchResults.where((searchResults){
//     //   final result =searchResults.toLowerCase();
//     //   final input =query.toLowerCase();
//     //   return result.conatines(input);
//     // }).toList();
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         final suggestion=suggestions[index];
//         return ListTile(
//           title: Text(suggestion),
//           trailing:const  Icon(Icons.arrow_forward_ios),
//           onTap: (){
//             query=suggestion;
//             showResults(context);
//           },
//         );
//       },
//     );
//   }
// }
