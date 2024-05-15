import 'package:flutter/material.dart';
import 'DataList.dart';

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 300,  // Adjust the height to accommodate two rows
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: DataList.boardMenu.length,  // Total number of items
        itemBuilder: (context, index) {
          return Container(
            height: 115,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey,
                    width: 0.2
                ),
                color: Colors.white
              // Placeholder color
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.5, top: 5.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          DataList.question[index],
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(4.0)
                      ),
                      Container(
                        width : 200,
                        child: Text(
                          Board.boardContent[index],
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.grey
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(4.0)
                      ),
                      Container(
                        child: Text(
                          Board.boardGood[index],
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.grey
                          ),
                        ),
                      ),

                    ],
                  ),
                ),//글씨 박스
                Container(
                  margin: EdgeInsets.only(right: 10.5),
                  height:82,
                  width: 82,
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ), // 이미지박스
              ],
            ),
          );
        },
      ),
    );
  }
}