import 'package:flutter/material.dart';
import 'package:appnew1/totalpages.dart/home.dart';
import 'package:appnew1/totalpages.dart/tbs.dart';
import 'package:appnew1/water2.dart';
import 'request.dart';
import 'water3.dart';

class bills extends StatefulWidget {
  const bills({super.key});

  @override
  State<bills> createState() => _billsState();
}

int _count1 = 0;
List<String> _name = [];
List<String> _remark = [];
List<String> selectId = [];

class _billsState extends State<bills> {
  Future<void> getdata() async {
    var res = await http.get("/Flow/GetFlowList", queryParameters: {
      "projectids": "[0]",
      "pagenumber": 1,
      "pagesize": 30,
      "keywords": "#"
    });
    setState(() {
      // print(res.data["data"]["counts"]);
      // _count1 = int.parse(res.data["data"]["counts"]);
      var tables = res.data["data"]["tables"];
      _name = [];
      _remark = [];
      selectId = [];
      _count1 = 0;
      for (var table1 in tables) {
        if (table1["flowType"]["name"] != null) {
          _name.add(table1["flowType"]["name"]);
          _remark.add(table1["flowType"]["remark"]);
          selectId.add(table1["flow"]["id"]);
          _count1++;
        }
      }
      // print(_name);
      // print(_remark);
      // print(selectId);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return tbs();
              }));
            },
          ),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _count1,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: 1.0, color: Colors.white24))),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      water3(data: selectId[index])));
                            },
                            icon: Icon(Icons.autorenew, color: Colors.white))),
                    title: Text(
                      '${index + 1}' + "${_name[index]}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("中级", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        TextButton(
                            onPressed: () {},
                            child: Text("${_remark[index]}",
                                style: TextStyle(color: Colors.white)))
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                water2(data: selectId[index])));
                      },
                    )),
              ),
            );
          },
        ));
  }
}
