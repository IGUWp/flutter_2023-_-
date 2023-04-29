import 'package:flutter/material.dart';
import 'package:flutter_application_1/totalpages.dart/tbs.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class water extends StatefulWidget {
  const water({super.key});

  @override
  State<water> createState() => _waterState();
}

class _waterState extends State<water> {
  List<AssetEntity> _select = [];
  Widget _buildPhotosList() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        return Wrap(
          children: [
            for (final asset in _select)
              AssetEntityImage(
                asset,
                width: width,
                height: width,
                fit: BoxFit.cover,
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
                    width: width,
                    height: width,
                    child: Icon(
                      Icons.add_a_photo,
                      size: 48,
                    )),
              ),
          ],
        );
        ;
      },
    );
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
        Padding(padding: EdgeInsets.all(10)),
        TextField(
            decoration: InputDecoration(
          hintText: '项目编号',
          labelText: '项目编号',
        )),
        TextField(
            decoration: InputDecoration(
          hintText: '流水编号',
          labelText: '流水编号',
        )),
        TextField(
            decoration: InputDecoration(
          hintText: '单据编号',
          labelText: '单据编号',
        )),
        TextField(
            decoration: InputDecoration(
          hintText: '流水类型',
          labelText: '流水类型',
        )),
        TextField(
            decoration: InputDecoration(
          hintText: '经手人',
          labelText: '经手人',
        )),
        TextField(
            decoration: InputDecoration(
          hintText: '财务负责人',
          labelText: '财务负责人',
        )),
        Container(
          height: 50,
          width: 800,
          child: TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return tbs();
              }));
            },
            child: Text("上交"),
          ),
        ),
        Container(
            height: 50,
            width: 800,
            child: TextButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(2023, 6, 7), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Row(
                  children: [
                    Text(
                      '请选择日期',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17,
                      ),
                    )
                  ],
                ))),
        _buildPhotosList()
      ]),
    );
  }
}
