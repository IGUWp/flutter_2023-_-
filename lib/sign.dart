// ignore_for_file: camel_case_types, duplicate_ignore, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter_application_1/request.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/water2.dart';

import 'totalpages.dart/tbs.dart';

class sign extends StatefulWidget {
  const sign({super.key});
  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  @override
  Widget build(BuildContext context) {
    return materialApp();
  }
}

class materialApp extends StatefulWidget {
  const materialApp({super.key});

  @override
  State<materialApp> createState() => _materialAppState();
}

class _materialAppState extends State<materialApp> {
  TextEditingController myController1 =
      TextEditingController(text: "18188390092");
  TextEditingController myController2 = TextEditingController(text: "123456");
  @override
  String _data1 = ""; //username
  String _data2 = ""; //paw
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('记账小软件'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: TextField(
              controller: myController1,
              decoration: InputDecoration(
                // hintText: _data1,
                helperText: "请输入账号",
                icon: Icon(Icons.person),
              )),
        ),
        Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: TextField(
              obscureText: true,
              controller: myController2,
              decoration: InputDecoration(
                // hintText: _data2,
                helperText: "请输入密码",
                icon: Icon(Icons.lock),
              ),
            )),
        Container(
            height: 43,
            width: 200,
            margin: EdgeInsets.fromLTRB(0, 100, 0, 20),
            child: OutlinedButton(
              onPressed: () async {
                Response res = await http.post("/UserEntity/Login", data: {
                  "UserName": myController1.text,
                  "PassWord": myController2.text
                });
                setState(() {
                  if (res.data["status"] == true) {
                    print(res.data);
                    http.token = res.data["data"];
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (BuildContext) {
                      return tbs();
                    }));
                  }
                });
              },
              child: Text(
                '登录',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )),
      ]),
    );
  }
}//13879694217
//123456
