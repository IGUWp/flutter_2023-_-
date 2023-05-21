// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'sign.dart';

class register extends StatefulWidget {
  final String username;
  const register({super.key, required this.username});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  //为获取文本中的值，先执行编辑控制器
  //final mycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back),
      )),
      body: Column(children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: TextField(
              //controller: mycontroller,
              decoration: InputDecoration(
            hintText: "请输入账号",
            icon: Icon(Icons.person),
          )),
        ),

        /////////////////////////////
        Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "请输入密码",
                icon: Icon(Icons.lock),
              ),
            )),
        Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "请确认密码",
                icon: Icon(Icons.lock),
              ),
            )),
        Container(
            height: 43,
            width: 200,
            margin: EdgeInsets.fromLTRB(0, 100, 0, 20),
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return sign();
                }));
              },
              child: Text(
                '注册',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )),
      ]),
    ));
  }
}
