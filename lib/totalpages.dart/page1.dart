import 'package:flutter/material.dart';
import 'package:flutter_application_1/personthings/account.dart';
import 'package:flutter_application_1/personthings/company.dart';
import 'package:flutter_application_1/personthings/department.dart';
import 'package:flutter_application_1/personthings/password.dart';
import 'package:flutter_application_1/personthings/post.dart';
import 'package:flutter_application_1/personthings/username.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 130, 141, 147),
        elevation: 0,
        centerTitle: true,
      ),
      body: Card(
        margin: EdgeInsets.all(5),
        child: Column(children: [
          Container(
            height: 50,
            width: 600,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return username();
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "我的姓名",
                      textAlign: TextAlign.left,
                    ),
                  ],
                )),
          ),
          Container(
            height: 50,
            width: 600,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return account();
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "我的账号",
                      textAlign: TextAlign.left,
                    ),
                  ],
                )),
          ),
          Container(
            height: 50,
            width: 600,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return password();
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "我的密码",
                      textAlign: TextAlign.left,
                    ),
                  ],
                )),
          ),
          Container(
            height: 50,
            width: 600,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return company();
                  }));
                },
                child: Row(children: [
                  Text(
                    "我的公司",
                    textAlign: TextAlign.left,
                  ),
                ])),
          ),
          Container(
            height: 50,
            width: 600,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return dpt();
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "我的所属部门",
                      textAlign: TextAlign.left,
                    ),
                  ],
                )),
          ),
          Container(
            height: 50,
            width: 600,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return post();
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "我的职务",
                      textAlign: TextAlign.left,
                    ),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
