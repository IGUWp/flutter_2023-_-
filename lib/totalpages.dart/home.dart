// ignore_for_file: duplicate_import, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bills.dart';
import 'package:flutter_application_1/items.dart';
import 'package:flutter_application_1/totalpages.dart/page1.dart';
import 'package:flutter_application_1/sign2.dart';
import 'package:flutter_application_1/water.dart';
import 'tbs.dart';
import 'package:flutter_application_1/_card.dart';

class MyWidget1 extends StatefulWidget {
  MyWidget1({super.key});

  @override
  State<MyWidget1> createState() => _MyWidget1State();
}

class _MyWidget1State extends State<MyWidget1> {
  @override
  // ignore: override_on_non_overriding_member

//////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 130, 141, 147),
        elevation: 0,
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 0,
        crossAxisCount: 3, //一行有几列
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Center(
              child: Text("姓名：abc"),
            ),
          ),
          Container(),
          Container(),
          Container(
            padding: EdgeInsets.all(0),
            width: 260,
            height: 90,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return water();
                  }));
                },
                child: Text(
                  "添加新的账单",
                  style: TextStyle(fontSize: 20),
                )),
          ),
          Container(
            padding: EdgeInsets.all(0),
            width: 260,
            height: 90,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return bills();
                  }));
                },
                child: Text(
                  "查询我的账单",
                  style: TextStyle(fontSize: 20),
                )),
          ),
          Container(
            padding: EdgeInsets.all(0),
            width: 260,
            height: 90,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return items();
                  }));
                },
                child: Text(
                  "项目集合",
                  style: TextStyle(fontSize: 20),
                )),
          ),
          Container(
            padding: EdgeInsets.all(0),
            width: 260,
            height: 90,
            child: TextButton(
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
