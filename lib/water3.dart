import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/request.dart';
import 'package:flutter_application_1/totalpages.dart/tbs.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

String initData = '请选择项目';
String _price = "出入账"; //选择
double InAmount = 0;
double OutAmount = 0;
double amount = 0;
String initData2 = '请选择流水类型';
String documentNumber = ''; //单据编号
String remark = '';
String _date = "请选择日期";
List? selectoptios;
List<String> tableNames = [];

List<dynamic>? floetype;
List<dynamic>? projects;
List<dynamic>? images;

class water3 extends StatefulWidget {
  var data;

  water3({super.key, required this.data});

  @override
  State<water3> createState() => _water3State();
}

Future<String> image2Base64(File? file) async {
  List<int> imageBytes = await file!.readAsBytes();
  return base64Encode(imageBytes).toString();
}

class _water3State extends State<water3> {
  Future<void> getdata() async {
    var res = await http.get("/Flow/GetAFlowAllInfo?id=" + widget.data);
    var x = res.data["data"]; //节省
    setState(() {
      initData = x["project"]["name"];
      InAmount = double.parse(x["flow"]["flow"]["inAmount"].toString());
      OutAmount = double.parse(x["flow"]["flow"]["outAmount"].toString());
      documentNumber = x["flow"]["flow"]["documentNumber"];
      remark = x["flow"]["flow"]["remark"];
      initData2 = x["flow"]["flowType"]["name"];

      if (InAmount == 0) {
        _price = "出账";
        amount = OutAmount;
      } else {
        _price = "入账";
        amount = InAmount;
      }
      myController1 = TextEditingController(text: amount.toString());
      myController2 = TextEditingController(text: documentNumber);
      myController3 = TextEditingController(text: remark);
    });
  }

  Future<void> UpdataProjects() async {
    var res = await http.get("/Project/GetProjectList", queryParameters: {
      "pagenumber": 1,
      "pagesize": 1000,
      "keywords": "#",
      "businessids": "[0]",
    });
    print(res.data);
    var tables = res.data["data"]["tables"];

    if (true) {
      // print(tables.runtimeType);
      projects = tables;
    }
  }

  Future<void> Updataflowid() async {
    var res = await http.get("/flow/GetFlowTypes");
    var tables = res.data["data"];
    if (true) {
      floetype = tables;
    }
  }

  @override
  void initState() {
    super.initState();
    getdata();
    UpdataProjects();
    Updataflowid();
  }

  List<AssetEntity> _select = [];
  List<Map> _select2 = [];
  Widget _buildPhotosList() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Wrap(
          children: [
            for (final asset in _select)
              AssetEntityImage(
                asset,
                width: 96,
                height: 96,
              ),
            if (_select.length < 9)
              GestureDetector(
                onTap: () async {
                  final List<AssetEntity>? result =
                      await AssetPicker.pickAssets(context,
                          pickerConfig:
                              AssetPickerConfig(selectedAssets: _select));
                  setState(() {
                    _select = result ?? [];
                  });
                },
                child: Container(
                    width: 96,
                    height: 96,
                    color: Color.fromARGB(255, 146, 166, 177),
                    child: const Icon(
                      Icons.add_a_photo,
                      size: 78,
                    )),
              ),
          ],
        );
        ;
      },
    );
  }

  TextEditingController myController1 = TextEditingController(text: "");
  TextEditingController myController2 = TextEditingController(text: "");
  TextEditingController myController3 = TextEditingController(text: "");
  void showCupertinoDialogSure() {
    var dialog = CupertinoAlertDialog(
      content: Text(
        "请输入金额",
        style: TextStyle(fontSize: 20),
      ),
      actions: <Widget>[
        CupertinoButton(
          child: Text("确定"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );

    showDialog(context: context, builder: (_) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流水信息'),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 130, 141, 147),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(children: [
        const Padding(padding: EdgeInsets.all(10)),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 30,
          child: InkWell(
              onTap: () async {
                tableNames.clear(); //////////////////////////////////////
                var res =
                    await http.get("/Project/GetProjectList", queryParameters: {
                  "pagenumber": 1,
                  "pagesize": 1000,
                  "keywords": "#",
                  "businessids": "[0]",
                });
                print(res.data);
                var tables = res.data["data"]["tables"];

                if (true) {
                  // print(tables.runtimeType);
                  projects = tables;
                }
                for (var table in tables) {
                  if (table["name"] != null &&
                      !tableNames.contains(table["name"])) {
                    tableNames.add(table["name"]);
                  }
                } //剔除为null和重复的name

                Pickers.showSinglePicker(context,
                    data: tableNames,
                    selectData: initData,
                    onConfirm: (p, index) {
                      setState(() {
                        initData = p;
                      });
                      return p;
                    },
                    onChanged: (p, index) => print('数据发生改变：$p'));
              },
              //虽然不知道每一个代码的含义，但还是不要更改  (` __ `)
              child: Text(
                style: TextStyle(
                  fontSize: 25,
                ),
                initData,
              )),
        ),
        Container(
          height: 30,
          margin: EdgeInsets.only(top: 10),
          child: InkWell(
              onTap: () async {
                tableNames.clear(); //////////////////////////////////////
                var res = await http.get("/flow/GetFlowTypes");
                var tables = res.data["data"];
                if (true) {
                  floetype = tables;
                }
                for (var table in tables) {
                  if (table["name"] != null &&
                      !tableNames.contains(table["name"])) {
                    tableNames.add(table["name"]);
                  }
                } //剔除为null和重复的name

                Pickers.showSinglePicker(context,
                    data: tableNames,
                    selectData: initData2,
                    onConfirm: (p, index) {
                      setState(() {
                        initData2 = p;
                      });
                      return p;
                    },
                    onChanged: (p, index) => print('数据发生改变：$p'));
              },
              //虽然不知道每一个代码的含义，但还是不要更改  (` __ `)
              child: Text(
                style: TextStyle(
                  fontSize: 25,
                ),
                initData2,
              )),
        ),
        Container(
            height: 30,
            margin: EdgeInsets.only(top: 10),
            child: InkWell(
                onTap: () {
                  Pickers.showSinglePicker(
                    context,
                    data: ['出账', '入账'],
                    selectData: _price,
                    onConfirm: (p, index) {
                      setState(() {
                        _price = p;
                      });
                    },
                    // onChanged: (p, index) => print('数据发生改变：$p')
                  );
                },
                child: Text(
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    '$_price'))),
        TextField(
            controller: myController1,
            decoration: InputDecoration(
              hintText: '金额',
              labelText: '金额',
            )),
        TextField(
            controller: myController2,
            decoration: InputDecoration(
              hintText: '单据编号',
              labelText: '单据编号',
            )),
        TextField(
            controller: myController3,
            decoration: InputDecoration(
              hintText: '备注',
              labelText: '备注',
            )),
        const Padding(padding: EdgeInsets.all(10)),
        _buildPhotosList(),
        SizedBox(
          height: 50,
          width: 800,
          child: TextButton(
            onPressed: () async {
              try {
                if (_price == "出账") {
                  InAmount = 0;
                  OutAmount = double.parse(myController1.text ?? "0");
                } else {
                  OutAmount = 0;
                  InAmount = double.parse(myController1.text ?? "0");
                }
              } catch (e) {
                // 出现异常时向用户显示错误消息，提示用户输入有效数字
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('错误'),
                    content: const Text('请输入有效数字'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, '确定'),
                        child: const Text('重新更改'),
                      ),
                    ],
                  ),
                );
                return;
              }
              // var da = {
              //   "ProjectId": projects!
              //       .where((e) => e["name"] == initData)
              //       .toList()
              //       .first["id"],
              //   "DocumentNumber": myController2.text,
              //   "FlowTypeId": floetype!
              //       .where((e) => e["name"] == initData2)
              //       .toList()
              //       .first["id"],
              //   "InAmount": InAmount,
              //   "OutAmount": OutAmount,
              //   "Remark": myController3.text,
              //   "Files": _select2
              // };
              // print(da);
              List<Future> futures = [];
              for (var i = 0; i < _select.length; i++) {
                futures.add(_select[i].file.then((res) async {
                  String base64String = await image2Base64(res);
                  setState(() {
                    _select2.add({
                      "FileName": _select[i].title,
                      "FileType": _select[i].mimeType,
                      "FileStream": "data:" +
                          _select[i].mimeType! +
                          ";base64," +
                          base64String,
                    });
                  });
                }).catchError((error) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text(
                              'An error occurred while processing the file. Please try again.'),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                }));
              }
              // print(_select2);
              // print(da);

              var tasks = Future.wait(futures);

              var da = {
                "Id": widget.data,
                "ProjectId": projects!
                    .where((e) => e["name"] == initData)
                    .toList()
                    .first["id"],
                "DocumentNumber": myController2.text,
                "FlowTypeId": floetype!
                    .where((e) => e["name"] == initData2)
                    .toList()
                    .first["id"],
                "InAmount": InAmount,
                "OutAmount": OutAmount,
                "Remark": myController3.text,
                //"Files": _select2
              };
              // print(da);
              tasks.then((v) => {
                    da["Files"] = _select2,
                    // print(da),
                    http.post("/flow/updateflow", data: da).then((res) {
                      // 处理响应结果
                      // print(res.data);
                      if (res.data["status"]) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Success'),
                                content: Text(jsonEncode("提交成功")),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      // Navigator.of(context).pop();
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return tbs();
                                      }));
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    }).catchError((error) {
                      // 处理错误信息
                      print(error);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text(jsonEncode(error)),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: Text('OK'),
                                  onPressed: () async {
                                    try {
                                      if (_price == "出账") {
                                        InAmount = 0;
                                        OutAmount = double.parse(
                                            myController1.text ?? "0");
                                      } else {
                                        OutAmount = 0;
                                        InAmount = double.parse(
                                            myController1.text ?? "0");
                                      }
                                    } catch (e) {
                                      // 出现异常时向用户显示错误消息，提示用户输入有效数字
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text('错误'),
                                          content: const Text('请输入有效数字'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, '确定'),
                                              child: const Text('确定'),
                                            ),
                                          ],
                                        ),
                                      );
                                      return;
                                    }
                                    List<Future> futures = [];
                                    for (var i = 0; i < _select.length; i++) {
                                      futures.add(
                                          _select[i].file.then((res) async {
                                        String base64String =
                                            await image2Base64(res);
                                        setState(() {
                                          _select2.add({
                                            "FileName": _select[i].title,
                                            "FileType": _select[i].mimeType,
                                            "FileStream": "data:" +
                                                _select[i].mimeType! +
                                                ";base64," +
                                                base64String,
                                          });
                                        });
                                      }).catchError((error) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Error'),
                                                content: Text(
                                                    'An error occurred while processing the file. Please try again.'),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                    child: Text('OK'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            });
                                      }));
                                    }
                                    // print(_select2);
                                    // print(da);

                                    var tasks = Future.wait(futures);

                                    var da = {
                                      "ProjectId": projects!
                                          .where((e) => e["name"] == initData)
                                          .toList()
                                          .first["id"],
                                      "DocumentNumber": myController2.text,
                                      "FlowTypeId": floetype!
                                          .where((e) => e["name"] == initData2)
                                          .toList()
                                          .first["id"],
                                      "InAmount": InAmount,
                                      "OutAmount": OutAmount,
                                      "Remark": myController3.text,
                                      //"Files": _select2
                                    };
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    })
                  });
            },
            child: Text("更改"),
          ),
        ),
      ]),
    );
  }
}
