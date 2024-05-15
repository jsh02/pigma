
import 'package:flutter/material.dart';

import 'CommunityPage.dart';
import 'SportingPage.dart';

class BottomNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;  // Current index of selected page

  // List of widgets to display for each tab
  final List<Widget> _widgetOptions = [
    Text(
      '홈',
      style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
    ),
    CommunityPage(),
    SportingPage(),
    Text(
        '채팅',
         style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
    ),
    Text(
      '계정',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Display the widget from _widgetOptions based on the selected index
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("images/homeN.png", width: 22, height: 22),
            activeIcon: Image.asset("images/homeY.png", width: 22, height: 22),
            label: '홈' ,
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/teamN.png", width: 22, height: 22),
            activeIcon: Image.asset("images/teamY.png", width: 22, height: 22),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/sportingN.png", width: 22, height: 22),
            activeIcon: Image.asset("images/sportingY.png", width: 22, height: 22),
            label: '스포팅',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/chatN.png", width: 22, height: 22),
            activeIcon: Image.asset("images/chatY.png", width: 22, height: 22),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/accountN.png", width: 22, height: 22),
            activeIcon: Image.asset("images/accountY.png", width: 22, height: 22),
            label: 'MY',
          ),


        ],
        selectedItemColor: Colors.black, // 색상을 검은색으로 설정
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,  // Which item is currently selected
        onTap: _onItemTapped,  // Handle tap
      ),
    );
  }
}