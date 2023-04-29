import 'package:flutter/material.dart';
import 'package:flutter_application_1/totalpages.dart/tbs.dart';

class _card extends StatelessWidget {
  const _card({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10)),
      shadowColor: Colors.cyan,
      //card的文本设置
      child: Column(children: [
        GestureDetector(
          onTapDown: (details) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return tbs();
            }));
          },
          child: Column(children: [
            ListTile(
              title: GestureDetector(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "请输入类型",
                  ),
                ),
                // onTap: () => print('111'),
              ),
              subtitle: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "请输入金额",
                ),
                textAlign: TextAlign.right,
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
