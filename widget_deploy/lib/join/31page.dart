import 'package:flutter/material.dart';
import '32page.dart';
import '33page.dart';
import '34page.dart';
import '35page.dart';


class Page31 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);  // 처음 페이지 조절

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 50),  // 화면의 끝과 페이지 간의 간격 조절
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) => buildDot(index: index)),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                Page32(),
                Page33(),
                Page34(),
                Page35(),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return Container(
      height: 7,   // 점크기 조절
      width: 7,    // 점크기 조절
      margin: EdgeInsets.symmetric(horizontal: 5),  // 점과 점 사이 길이조절
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.black : Colors.grey,  // 활성점과 비활성점 색깔조절
        shape: BoxShape.circle,  // 점의 모양 조절
      ),
    );
  }
}