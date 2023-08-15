// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class SettingWidget extends StatefulWidget {
  const SettingWidget ({Key? key}) : super(key: key);

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}
class _SettingWidgetState extends State<SettingWidget>{
  var Ministry;
  var Language;
  var search;
  final _searchController= TextEditingController();
  final List locale=[
    {'name':'English','locale': const Locale('en','US')},
    {'name':'العربية','locale': const Locale('ar','lb')},
  ];
  updatelanguage(Locale locale){
   Get.back();
   Get.updateLocale(locale);
  }
  builddialoug(BuildContext context){
    showDialog
    (context: context,
     builder: (builder){
      return AlertDialog(
        title: Text("lang".tr),
        content: Container(
          width:double.maxFinite,
          child:ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap:() {
                   // ignore: avoid_print
                   print(locale[index]['name']);
                   updatelanguage(locale[index]['locale']);
                  },
                  child: Text(
                    locale[index]['name']
                    ),
                ),
              );
            },
             separatorBuilder: (context,index){
              return const Divider(
                color: Colors.green,
              );
             },
              itemCount:locale.length)
        ),
      );
     });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 400,
          height: double.infinity,
          color: const Color(0xBEC5C5C5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 24,
                    height: 19,
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22.40),
                        Container(
                          child : Text("sort".tr,
                          style: GoogleFonts.robotoSerif(
                            fontSize:20,
                          ),)
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 209, 209, 209),
                          ),
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 20, right: 10),
                          margin: const EdgeInsets.only(
                            top: 35,
                            left: 35,
                            right: 35,
                          ),
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(8),
                            underline: const Divider(color: Colors.transparent),
                            dropdownColor:
                                const Color.fromARGB(255, 209, 209, 209),
                            iconSize: 40,
                            isExpanded: true,
                            hint: Text(
                              "min".tr,
                              style: GoogleFonts.robotoSerif(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textDirection: TextDirection.ltr,
                            ),
                            items: [
                              "min1".tr,
                              "min2".tr,
                            ]
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                Ministry = val.toString();
                              });
                            },
                            value: Ministry,
                          ),
                        ),
              const SizedBox(height: 22.40),
              Container(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 15, left: 35, right: 35),
                          child: TextFormField(
                            controller: _searchController,
                            onChanged: (text) {
                              search = text;
                            },
                            style: const TextStyle(fontSize: 15),
                            textInputAction: TextInputAction.next,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              prefixIconColor: (const Color.fromARGB(255, 133, 204, 154)),
                              hintText: "Search".tr,
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 209, 209, 209),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 2,
                                  )),
                            ),
                          )),
            const SizedBox(height: 22.40),
            IconButton(onPressed: (){
               builddialoug(context);
              },
              style: ElevatedButton.styleFrom(
              backgroundColor:const Color.fromARGB(255, 209, 209, 209),
              textStyle: GoogleFonts.robotoSerif(
                fontSize: 18,
              )
          ),
              icon:const Icon(Icons.language,
              color:Color.fromARGB(255, 76, 117, 88) ,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
