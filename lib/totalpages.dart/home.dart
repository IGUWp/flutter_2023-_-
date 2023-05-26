// ignore_for_file: duplicate_import, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:appnew1/bills.dart';
import 'package:appnew1/items.dart';
import 'package:appnew1/request.dart';
import 'package:appnew1/sign.dart';
import 'package:appnew1/water.dart';
import 'tbs.dart';

class MyWidget1 extends StatefulWidget {
  MyWidget1({super.key});

  @override
  State<MyWidget1> createState() => _MyWidget1State();
}

class _MyWidget1State extends State<MyWidget1> {
  @override
  String name = "";
  void initState() {
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    var res = await http.get(
      "/UserEntity/GetOwnInfo",
    );
    if (res.statusCode == 200) {
      setState(() {
        name = res.data["data"]["name"];
        print(name);
      });
    } else {
      print("Error: ${res.statusCode}");
    }
  }
  // ignore: override_on_non_overriding_member

//////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return sign();
            }));
          },
        ),
        title: Text('首页'),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 130, 141, 147),
        elevation: 0,
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisSpacing: 1,
        mainAxisSpacing: 0,
        crossAxisCount: 3, //一行有几列
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Center(
                child: Row(children: [
              Icon(
                Icons.person,
                size: 49,
              ),
              Text("姓名:" + name),
            ])),
          ),
          Container(),
          Container(),
          Container(
            padding: EdgeInsets.all(0),
            width: 260,
            height: 90,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return water();
                  }));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 59, 0, 87))),
                child: Column(
                  children: [
                    Icon(
                      Icons.addchart_outlined,
                      size: 90,
                    ),
                    Text(
                      "添加新账单",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )),
          ),
          Container(
            padding: EdgeInsets.all(0),
            width: 260,
            height: 90,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return bills();
                  }));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 0, 139, 133))),
                child: Column(
                  children: [
                    Icon(
                      Icons.find_in_page,
                      size: 90,
                    ),
                    Text(
                      "查询账单",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )),
          ),
          // Container(
          //   padding: EdgeInsets.all(0),
          //   width: 260,
          //   height: 90,
          //   child: ElevatedButton(
          //       onPressed: () {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (BuildContext context) {
          //           return items();
          //         }));
          //       },
          //       style: ButtonStyle(
          //           backgroundColor: MaterialStatePropertyAll(
          //               Color.fromARGB(255, 0, 16, 87))),
          //       child: Column(
          //         children: [
          //           Icon(
          //             Icons.format_align_left,
          //             size: 80,
          //           ),
          //           Text(
          //             "项目集合",
          //             style: TextStyle(fontSize: 20),
          //           )
          //         ],
          //       )),
          // ),
          Container(
            padding: EdgeInsets.all(0),
            width: 260,
            height: 90,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return tbs();
                  }));
                },
                child: Text(
                  "未知",
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ],
      ),
    );
  }
}
