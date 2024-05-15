import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DataList.dart';
import 'QuestionPage.dart';
import 'SportingPage.dart';
// 페이지 2개 쳐박고 용량이 500메가인데 이 말도 안되는 용량은 어떻게 처리하죠..?

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPage createState() => _CommunityPage();
}

class _CommunityPage extends State<CommunityPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '읍면동',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        // 페이지 구현
        child: Column(
          // 세로 배치
          children: <Widget>[
            SizedBox(height: 5), // 틈을 구현 패딩이나 마진으로 틈을 만드는거랑 사이드박스랑 어떤게 더 좋을까요
            _Event(title: "이벤트"), // 함수로 구현
            SizedBox(height: 5),
            _freeBoard(title: '자유 게시판'),
            contentContainer(),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF0F0F0),
    );
  }

  Widget _button({required String title}) {
    // 더보기 버튼
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: Colors.grey),
      ),
    );
  } // 더보기 이름의 버튼인데 함수로 구현연습하기 위해서 작성

  Widget _Event({required String title}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                _button(title: "더보기")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.5),
            height: 127,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 127,
                  height: 127,
                  margin: EdgeInsets.symmetric(horizontal: 2.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors
                        .grey[300], // Placeholder color// Border for each item
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _freeBoard({required String title}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _button(title: "더보기")
                ],
              ),
            ),
            menuButtons(),
          ]),
    );
  }

  Widget menuButtons() {
    return Container(
      margin: const EdgeInsets.only(left: 10.5, bottom: 10.5),
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: DataList.boardMenu.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2.5),
            child: TextButton(
              onPressed: () {
                setState(() {
                  selectedIndex = index; // 사용자가 선택한 인덱스로 상태 업데이트
                });
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.grey))),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.circle, size: 14),
                  const SizedBox(width: 5),
                  Text(
                    DataList.boardMenu[index],
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(width: 3),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget contentContainer() {
    List<List<String>> dataSources = [
      Board.boardTitle,
      Question.questionTitle,
      Game.gameTitle,
      Worried.worriedTitle,
      Hunting.huntingTitle
    ];
    List<List<String>> contentSources = [
      Board.boardContent,
      Question.questionContent,
      Game.gameContent,
      Worried.worriedContent,
      Hunting.huntingContent
    ];
    List<List<String>> goodSources = [
      Board.boardGood,
      Question.questionGood,
      Game.gameGood,
      Worried.worriedGood,
      Hunting.huntingGood
    ];

    // 데이터 소스가 유효한 범위인지 확인하고, 유효하지 않다면 기본 컨테이너 반환
    return dynamicContentContainer(dataSources[selectedIndex],
        contentSources[selectedIndex], goodSources[selectedIndex]);
  }

  Widget dynamicContentContainer(
      List<String> titles, List<String> contents, List<String> goods) {
    return Container(
      padding: const EdgeInsets.only(top: 4),
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Container(
            height: 115,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.2),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10.5, top: 5.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(titles[index],
                          style: const TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w500)),
                      const Padding(padding: EdgeInsets.all(4.0)),
                      SizedBox(
                        width: 200,
                        child: Text(contents[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.grey)),
                      ),
                      const Padding(padding: EdgeInsets.all(4.0)),
                      Text(goods[index],
                          style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.grey)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10.5),
                  height: 82,
                  width: 82,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
