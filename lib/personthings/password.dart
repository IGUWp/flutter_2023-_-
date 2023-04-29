import 'package:flutter/material.dart';

class password extends StatefulWidget {
  const password({super.key});

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("更改密码"),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 130, 141, 147),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(children: [
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
          TextField(
            decoration: InputDecoration(hintText: "更改密码"),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
          TextField(
            decoration: InputDecoration(hintText: "确认密码"),
          ),
        ]),
      ),
    );
  }
}
