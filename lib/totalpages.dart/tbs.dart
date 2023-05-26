import 'package:flutter/material.dart';
import 'home.dart';
import 'page1.dart';

class tbs extends StatefulWidget {
  const tbs({super.key});

  @override
  State<tbs> createState() => _tbsState();
}

class _tbsState extends State<tbs> {
  int _currentIndex = 0;
  //下面的三个方法都是三个界面的方法
  List _pageList = [MyWidget1(), page1()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              label: '首页'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.person_2_sharp,
                color: Colors.blue,
              ),
              label: '个人中心'),
        ],
      ),
    );
  }
}
