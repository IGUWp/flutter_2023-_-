import 'package:flutter/material.dart';
import 'package:flutter_application_1/water.dart';

void main() {
  runApp(items());
}

class items extends StatefulWidget {
  const items({super.key});

  @override
  State<items> createState() => _itemsState();
}

class _itemsState extends State<items> {
  @override
  Widget build(BuildContext context) {
    return itemsPage();
  }
}

class itemsPage extends StatefulWidget {
  @override
  _itemsPageState createState() => _itemsPageState();
}

class _itemsPageState extends State<itemsPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    widgets.add(getRow(1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("项目集合"),
      ),
      body: ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int position) {
            return getRow(position);
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              widgets.add(getRow(widgets.length + 1));
            });
          }),
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Padding(padding: EdgeInsets.all(10.0), child: _card()),
    );
  }
}

class _card extends StatelessWidget {
  const _card();

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
              return water();
            }));
          },
          child: Column(children: [
            ListTile(
              title: GestureDetector(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "类型",
                  ),
                ),
                // onTap: () => print('111'),
              ),
              subtitle: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "金额",
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
