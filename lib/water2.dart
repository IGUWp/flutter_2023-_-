import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appnew1/bills.dart';
import 'package:appnew1/request.dart';
import 'package:appnew1/totalpages.dart/tbs.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:full_screen_image/full_screen_image.dart';

String initData = '请选择项目';
String _price = "出入账"; //选择
double InAmount = 0;
double OutAmount = 0;
double amount = 0;
String initData2 = '请选择流水类型';
String documentNumber = ''; //单据编号
String remark = '';

class water2 extends StatefulWidget {
  String data;
  water2({super.key, required this.data});

  @override
  State<water2> createState() => _water2State();
}

String _date = "请选择日期";
List? selectoptios;
List<String> tableNames = [];

List<dynamic>? floetype;
List<dynamic>? projects;
List<dynamic>? images;

// base64 加密
Future<String> image2Base64(File? file) async {
  List<int> imageBytes = await file!.readAsBytes();
  return base64Encode(imageBytes).toString();
}

// base64解密
Image imageDecodeBase64(String base64) {
  var u8list = Base64Decoder().convert(base64.split(',')[1]);
  return Image.memory(u8list);
}

List<Widget> image_components = [];

class _water2State extends State<water2> {
  void transulatebase64(var x) async {
    // print(await x["flow"]["flowFiles"]);
    images = await x["flow"]["flowFiles"];
    image_components = [];
    images!.forEach((e) {
      image_components.add(FullScreenWidget(
        disposeLevel: DisposeLevel.Low,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: imageDecodeBase64(e["base64"])),
      )
          // Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: 200,
          //     child: imageDecodeBase64(e["base64"])),
          );
    });
  }

  Future<void> getdata() async {
    var res = await http.get("/Flow/GetAFlowAllInfo?id=${widget.data}");
    var x = res.data["data"]; //节省
    setState(() {
      initData = x["project"]["name"];
      // transulatebase64(x);
      transulatebase64(x);
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

  @override
  void initState() {
    super.initState();
    getdata();
  }

  List<AssetEntity> _select = [];
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

  TextEditingController myController1 =
      TextEditingController(text: "${amount}"); //金额
  TextEditingController myController2 =
      TextEditingController(text: documentNumber); //单据编号
  TextEditingController myController3 =
      TextEditingController(text: remark); //remark 备注
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
        actions: [
          IconButton(
            onPressed: () async {
              var res = await http
                  .delete("/Flow/DeleteFlow?id=" + widget.data, data: {
                "id": widget.data
              }).then((res) => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Success'),
                          content: Text(jsonEncode("删除成功")),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return bills();
                                }));
                              },
                            ),
                          ],
                        );
                      }));
            },
            icon: Icon(Icons.delete),
          ),
        ],
        title: Text('流水信息'),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 130, 141, 147),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(children: [
        const Padding(padding: EdgeInsets.all(10)),
        Container(
          height: 30,
          margin: EdgeInsets.only(top: 10),
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
          margin: EdgeInsets.only(top: 10),
          height: 30,
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
        const Padding(padding: EdgeInsets.all(5)),
        Container(
            child: Column(
          children: image_components,
        ))
      ]),
    );
  }
}
