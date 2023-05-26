import 'package:flutter/material.dart';

class company extends StatefulWidget {
  const company({super.key});

  @override
  State<company> createState() => _companyState();
}

class _companyState extends State<company> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的公司"),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 130, 141, 147),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(children: [
          TextField(
            decoration: InputDecoration(hintText: "更改公司名称"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "更改公司ID"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "更改公司总经理人"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "更改公司注册地信息"),
          ),
        ]),
      ),
    );
  }
}
