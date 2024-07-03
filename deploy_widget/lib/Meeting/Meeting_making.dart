// 생성자가 모임을 만든경우를 case1 이라고 생각 후 개발
import 'package:flutter/material.dart';

import '../DataList.dart';
import 'Meeting_check.dart';

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppointmentPage1(),
    );
  }
}

class AppointmentPage1 extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage1> {
  int participants = 0;
  int selectedIndex = 0;
  String selectedCondition = '누구나';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '약속 잡기',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('종목',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 9),
                menuButtons(),

                SizedBox(height: 16),

                Text('장소',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: '경기도 용인시 모현읍 외대로 81 한국외국어대학교...',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('모집 인원',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        IconButton(
                          icon: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1), // 테두리 색상과 두께 설정
                              shape: BoxShape.circle, // 원형 테두리 설정
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0.3), // 아이콘과 테두리 사이의 여백 설정
                              child: Icon(
                                Icons.remove,
                                size: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (participants >0) participants--;
                            });
                          },
                        ),
                        Text('$participants', style: TextStyle(fontSize: 16)),
                        IconButton(
                          icon: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1), // 테두리 색상과 두께 설정
                              shape: BoxShape.circle, // 원형 테두리 설정
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0.3), // 아이콘과 테두리 사이의 여백 설정
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (participants >= 0) participants++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ), // 모집인원
                SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('참여 조건',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Container(
                        child: Row(
                      children: [
                        _buildConditionButton(
                            '누구나', selectedCondition == '누구나'),
                        _buildConditionButton('초보', selectedCondition == '초보'),
                        _buildConditionButton('중수', selectedCondition == '중수'),
                        _buildConditionButton('고수', selectedCondition == '고수'),
                      ],
                    )),
                  ],
                ), // 참여 조건
                SizedBox(height: 16),
                Text('일시',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: _buildDropdownButtonMonth('MM')),
                    SizedBox(width: 8),
                    Expanded(child: _buildDropdownButtonDay('DD')),
                    SizedBox(width: 8),
                    Expanded(child: _buildDropdownButtonTime('19:00')),

                    // 테두리 색
                  ],
                ),
                SizedBox(height: 16),
                Text('제목',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: '(추천) 한국외대 19시 러닝하실 분 4명 구해요!',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[400],
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                Text('내용',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: '내용을 입력하세요.',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[400],
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // 등록하기 버튼 기능 추가 MeetingCheckPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MeetingCheckPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // 테두리를 각지게 설정
                      ),
                      minimumSize: Size(double.infinity, 48),
                      backgroundColor: Colors.black,
                    ),
                    child: Text('등록하기',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConditionButton(String text, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 30,
      width: 50,
      child: TextButton(
        onPressed: () {
          setState(() {
            selectedCondition = text;
          });
        },
        style: TextButton.styleFrom(
          foregroundColor: isSelected ? Colors.black : Colors.black,
          backgroundColor: isSelected ? Colors.white : Colors.white,
          side: BorderSide(
              color: isSelected ? Colors.black : Colors.grey,
              width: isSelected ? 1.5 : 1,
          ),
          // 테두리 색상 조건 추가
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.black : Colors.black, // 글자 색상 통일
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownButtonMonth(String hint) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      hint: Text(hint),
      items: DataList.months.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          // 선택된 값 업데이트 로직 추가
        });
      },
    );
  }

  Widget _buildDropdownButtonDay(String hint) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      hint: Text(hint),
      items: DataList.days.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          // 선택된 값 업데이트 로직 추가
        });
      },
    );
  }

  Widget _buildDropdownButtonTime(String hint) {
    return Container(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        hint: Text(hint),
        items: DataList.months.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            // 선택된 값 업데이트 로직 추가
          });
        },
      ),
    );
  }

  Widget menuButtons() {
    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: DataList.items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.5),
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
                  const Icon(Icons.circle, size: 14, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    DataList.items[index],
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
}
