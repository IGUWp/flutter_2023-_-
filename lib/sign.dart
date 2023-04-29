// ignore_for_file: camel_case_types, duplicate_ignore, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dio/dio.dart';

import 'main.dart';
import 'totalpages.dart/home.dart';
import 'package:flutter/material.dart';
// import 'sign2.dart';
import 'totalpages.dart/tbs.dart';

// ignore: camel_case_types
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
  final myController = TextEditingController(
      //text: "请输入账号"
      );

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  String _data1 = ""; //username
  String _data2 = ""; //paw
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              controller: myController,
              decoration: InputDecoration(
                hintText: _data1,
                helperText: "请输入账号",
                icon: Icon(Icons.person),
              )),
        ),

        /////////////////////////////

        Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: _data2,
                helperText: "请输入密码",
                icon: Icon(Icons.lock),
              ),
            )),
        Container(
            height: 43,
            width: 200,
            margin: EdgeInsets.fromLTRB(0, 100, 0, 20),
            child: OutlinedButton(
              // onPressed: () async {
              //   Dio dio = new Dio();
              //   Response res = await dio
              //       .get("http://10.14.4.169:9090/api/UserAccount/ReturnOne");
              //   dio.post("http://10.14.4.169:9090/api/UserAccount/ReturnOne",
              //       data: {"username": _data1, "psw": _data2});
              //   setState(() {
              //     _data1 = res.data.toString();
              //     print(_data1);
              //     print(_data2);
              //   });
              // },
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return tbs();
                }));
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
}
