// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_final_fields, avoid_print, unused_field, unnecessary_import

import 'dart:io';

import 'package:flutter_pickers/pickers.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:appnew1/request.dart';

// class usehttp extends StatefulWidget {
//   const usehttp({super.key});

//   @override
//   State<usehttp> createState() => _usehttpState();
// }

// class _usehttpState extends State<usehttp> {
//   @override
//   void initState() {
//     super.initState();
//     getdata();
//   }

//   var jsonlist;

//   void getdata() async {
//     try {
//       var response = await Dio().get(baseurl + '/Company/GetCompanyListByName');
//       if (response.statusCode == 200) {
//         setState(() {
//           jsonlist = response.data["user"] as List;
//         });
//       } else {}
//     } catch (e) {
//       print(e);
//     }
//   }

//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: jsonlist == null ? 0 : jsonlist.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Card(
//           child: ListTile(
//             title: Text(jsonlist[index]['id']),
//             subtitle: Text(jsonlist[index]["name"]),
//           ),
//         );
//       },
//     );
//   }
// }

// void main() => runApp(
//       MaterialApp(
//           home: Scaffold(
//               //右下角浮动按钮区域
//               )),
//     ); //底部tabBar区域

// /////////////////////////
void main() => runApp(
      MaterialApp(
          home: Scaffold(
        //右下角浮动按钮区域
        body: asda(),
      )),
    );

class asda extends StatefulWidget {
  const asda({super.key});

  @override
  State<asda> createState() => _asdaState();
}

class _asdaState extends State<asda> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Pickers.showSinglePicker(context,
              data: () async {
                Response res =
                    await http.post("/Project/GetProjectList", data: {
                  "pagenumber": 1,
                  "pagesize": 1000,
                  "keywords": "#",
                  "businessids": "[0]",
                });
                return res.data["tables"];
              },
              selectData: initData,
              onConfirm: (p, index) {
                setState(() {
                  initData = p;
                });
                return p;
              },
              onChanged: (p, index) => print('数据发生改变：$p'));
        },
        child: Text('$initData'));
  }
}

String initData = 'PHP';
