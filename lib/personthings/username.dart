import 'package:flutter/material.dart';

class username extends StatefulWidget {
  const username({super.key});

  @override
  State<username> createState() => _usernameState();
}

class _usernameState extends State<username> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("更改名字"),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 130, 141, 147),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(children: [
          TextField(
            decoration: InputDecoration(hintText: "更改姓名"),
          ),
        ]),
      ),
    );
  }
}
