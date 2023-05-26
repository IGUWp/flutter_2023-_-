import 'package:flutter/material.dart';
import 'package:appnew1/personthings/account.dart';
import 'package:appnew1/personthings/company.dart';
import 'package:appnew1/personthings/department.dart';
import 'package:appnew1/personthings/password.dart';
import 'package:appnew1/request.dart';
import 'package:appnew1/personthings/username.dart';
import 'package:appnew1/sign.dart';
import 'package:appnew1/totalpages.dart/tbs.dart';
import 'package:appnew1/water2.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

Map<String, dynamic> _data = {};
String Address = "";
String Email = "";
String Name = "";
String Nick = "";
String Remark = "";
String userName = '';

class _page1State extends State<page1> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postdata();
  }

  Future<void> postdata() async {
    var res = await http.get(
      "/UserEntity/GetOwnInfo",
    );
    print(res.data["data"]["address"]);
    _data = {
      "Address": res.data["data"]["address"],
      "Email": res.data["data"]["email"],
      "Name": res.data["data"]["name"],
      "Nick": res.data["data"]["nick"],
      "Remark": res.data["data"]["remark"],
    };
    print(_data);
    setState(() {
      Address = _data["Address"];
      Email = _data["Email"];
      Name = _data["Name"];
      Nick = _data["Nick"];
      Remark = _data["Remark"];
      userName = res.data["data"]["userName"];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 130, 141, 147),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return sign();
            }));
          },
        ),
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
                    return username(data: _data);
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "我的姓名",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      Name,
                      textAlign: TextAlign.right,
                    ),
                  ],
                )),
          ),
          Container(
            height: 50,
            width: 600,
            child: TextButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (BuildContext context) {
                  //   return account();
                  // }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "我的账号",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      userName,
                      textAlign: TextAlign.right,
                    ),
                  ],
                )),
          ),
          // Container(
          //   height: 50,
          //   width: 600,
          //   child: TextButton(
          //       onPressed: () {
          //         Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (BuildContext context) {
          //           return password();
          //         }));
          //       },
          //       child: Row(
          //         children: [
          //           Text(
          //             "我的密码",
          //             textAlign: TextAlign.left,
          //           ),
          //         ],
          //       )),
          // ),
          Container(
            height: 50,
            width: 600,
            child: TextButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (BuildContext context) {
                  //   return company();
                  // }));
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "我的地址",
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        Address,
                        textAlign: TextAlign.right,
                      ),
                    ])),
          ),
          Container(
            height: 50,
            width: 600,
            child: TextButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (BuildContext context) {
                  //   return dpt();
                  // }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "我的邮箱",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      Email,
                      textAlign: TextAlign.right,
                    ),
                  ],
                )),
          ),
          Container(
            height: 50,
            width: 600,
            child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "备注",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      Remark,
                      textAlign: TextAlign.right,
                    ),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
