import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';
// void main() => runApp(
//       MaterialApp(
//           home: Scaffold(
//         //右下角浮动按钮区域

//         body: HomePage(),
//       )),
//     ); //底部tabBar区域

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String _data = "网络请求";
//   int _data1 = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           TextButton(
//             onPressed: () async {
//               Dio dio = new Dio();
//               Response res = await dio
//                   .get("http://10.14.4.169:9090/api/UserAccount/ReturnOne");
//               dio.post("http://10.14.4.169:9090/api/UserAccount/ReturnOne",
//                   data: {
//                     "userHomePage": "good",
//                      "psw": "123465",
//                      "age": 1
//                      });
//               setState(() {
//                 _data1 = res.data['data']['age'];
//                 print(_data1);
//               });
//             },
//             child: Text(_data1.toString()),
//             style: ButtonStyle(
//               backgroundColor:
//                   MaterialStateProperty.all<Color>(Colors.greenAccent),
//               foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
//             ),
//           ),
//           Container(
//             child: Text(_data),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sign.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  final imagePicker = ImagePicker();
  Future getimage() async {
    final Image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(Image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image == null ? Text("NO image selected") : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getimage,
        backgroundColor: Colors.amber,
        child: Icon(Icons.abc),
      ),
    );
  }
}
