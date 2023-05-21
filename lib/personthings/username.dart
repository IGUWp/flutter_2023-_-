import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/request.dart';
import 'package:flutter_application_1/totalpages.dart/page1.dart';
import 'package:flutter_application_1/totalpages.dart/tbs.dart';

class username extends StatefulWidget {
  Map<String, dynamic> data;
  username({super.key, required this.data});
  @override
  State<username> createState() => _usernameState();
}

TextEditingController myController1 = TextEditingController(text: "");

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
            controller: myController1,
            decoration: InputDecoration(hintText: widget.data["Name"]),
          ),
          Container(
              margin: EdgeInsets.only(top: 200),
              height: 50,
              width: 250,
              color: Color.fromARGB(95, 155, 201, 231),
              child: TextButton(
                  onPressed: () async {
                    var data = await {
                      "Address": widget.data["Address"],
                      "Email": widget.data["Email"],
                      "Nick": widget.data["Nick"],
                      "Name": myController1.text,
                      "Remark": widget.data["Remark"],
                    };
                    print(data);
                    var res = await http
                        .post("/UserEntity/UpdateOwnAccountInfo", data: data)
                        .then((res) => showDialog(
                            context: context,
                            builder: ((BuildContext context) {
                              return AlertDialog(
                                title: Text('Success'),
                                content: Text(jsonEncode("更改成功")),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return tbs();
                                      }));
                                    },
                                  ),
                                ],
                              );
                            })));
                  },
                  child: Text("更改")))
        ]),
      ),
    );
  }
}
