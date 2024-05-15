
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DataList.dart';

class SportingPage extends StatelessWidget {
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
        child: Column(
          children: <Widget>[
            SizedBox(height: 5 ),
            _buildHorizontal_Sporting(title: "오늘의 스포팅"),
            SizedBox(height: 5 ),
            _buildHorizontalmeeting(title: "임박 운동 약속"),
            SizedBox(height: 5 ),
            _buildHorizontalList(title: "종목으로 한눈에 쉽게!"),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF0F0F0),
    );
  }

  Widget _button({required String title}) {   // 더보기 버튼
    return TextButton(onPressed: (){},
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey
          ),
        ),
    );
  }


  Widget _buildHorizontal_Sporting({required String title}) {
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
                    color: Colors.grey[300], // Placeholder color// Border for each item
                  ),
                  child: Center(
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white, // Placeholder color// Border for each item
                      ),
                    ),
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
  List<String> items = ["러닝", "농구", "배드민턴", "테니스", "사냥", "풋살", "숨쉬기", "숨참기", "코딩", "게임"];
  Widget _buildHorizontalList({required String title}) {
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
            padding: EdgeInsets.all(10),
            height: 240,  // Adjust the height to accommodate two rows
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,  // Number of columns
                childAspectRatio: 1,  // Aspect ratio of each item
                mainAxisSpacing: 10,  // Space between rows
                crossAxisSpacing: 10,  // Space between columns
              ),
              itemCount: DataList.items.length,  // Total number of items
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300], // Placeholder color
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white, // Placeholder color
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        DataList.items[index], // Displaying item from the list
                        style: TextStyle(
                            color: Colors.black, // Text color
                            fontSize: 12, // Text size
                            fontWeight: FontWeight.w600 // Bold text
                        ),
                      ),
                    ],
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


  Widget _buildHorizontalmeeting({required String title}) {
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
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: DataList.meetings.length,
              itemBuilder: (context, index) {
                return Container(
                    width: 250,
                    margin: EdgeInsets.only( left: 10.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300], // Placeholder color
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left:10.5, top: 10.5, bottom: 7.5),
                          child: Text(
                            DataList.meetings[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70,
                              margin: EdgeInsets.only(left: 10.5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      DataList.infos[index],
                                      style: TextStyle(fontSize: 12)),
                                  Text(
                                      DataList.counts[index],
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              width: 100,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                );
              },
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }


}









