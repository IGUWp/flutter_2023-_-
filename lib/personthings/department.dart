import 'package:flutter/material.dart';

class dpt extends StatefulWidget {
  const dpt({super.key});

  @override
  State<dpt> createState() => _dptState();
}

class _dptState extends State<dpt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的部门"),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 130, 141, 147),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(children: [
          TextField(
            decoration: InputDecoration(hintText: "更改部门"),
          ),
        ]),
      ),
    );
  }
}
