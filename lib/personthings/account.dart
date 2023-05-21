import 'package:flutter/material.dart';
import 'package:flutter_application_1/request.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

TextEditingController controller1 = TextEditingController(text: "32134654");
String x = "20132132";
Map? _data;

class _accountState extends State<account> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> postdata() async {
    var res = await http.get(
      "UserEntity/GetOwnInfo",
    );
    _data = {
      "Address": res.data["data"]["Address"],
      "Email": res.data["data"]["Email"],
      "Name": res.data["data"]["Name"],
      "Nick": res.data["data"]["Nick"],
      "Remark": res.data["data"]["Remark"],
    };
    x = res.data["data"][""];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('更改账号'),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 130, 141, 147),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: TextField(
          // controller: controller1,
          decoration: InputDecoration(hintText: x),
        ),
      ),
    );
  }
}
