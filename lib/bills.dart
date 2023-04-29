import 'package:flutter/material.dart';
import 'package:flutter_application_1/water.dart';

class bills extends StatefulWidget {
  const bills({super.key});

  @override
  State<bills> createState() => _billsState();
}

class _billsState extends State<bills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 20,
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
                            onPressed: () {},
                            icon: Icon(Icons.autorenew, color: Colors.white))),
                    title: Text(
                      "账单1",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("中级", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        TextButton(
                            onPressed: () {},
                            child: Text("交通",
                                style: TextStyle(color: Colors.white)))
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return water();
                        }));
                      },
                    )),
              ),
            );
          },
        ));
  }
}
