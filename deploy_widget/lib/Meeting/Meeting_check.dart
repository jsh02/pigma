import 'package:flutter/material.dart';

class MeetingCheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExerciseAppointmentPage(),
    );
  }
}

class ExerciseAppointmentPage extends StatefulWidget {
  @override
  _ExerciseAppointmentPageState createState() =>
      _ExerciseAppointmentPageState();
}

class _ExerciseAppointmentPageState extends State<ExerciseAppointmentPage> {
  bool isParticipated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // 뒤로가기 기능 추가
          },
        ),
        title: Text('동네 운동 약속', style: TextStyle(
            fontSize: 17,
            color: Colors.black, fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 15,
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 15,
                ),
              ],
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'lib/images/profile1.png', // 여기에 이미지 경로를 입력하세요.
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1/4', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                        Text('참여 인원 현황',
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        _showParticipationDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isParticipated ? Colors.white: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: isParticipated ? Colors.black : Colors.grey,
                            width: isParticipated ? 1.0 : 0.0,
                          ),
                        ),
                      ),
                      child: Text(
                        '모집 중',
                        style: TextStyle(color: isParticipated ? Colors.black : Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Divider(),
                SizedBox(height: 12),
                Text(
                  '한국외대 정문 앞 19시 러닝 하실 분 4명 구합니다!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    _buildTag('러닝'),
                    _buildTag('4명'),
                    _buildTag('초보'),
                    _buildTag('17:00'),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  '안녕하세요!\n한국외국어대학교 학생입니다.\n\n학교 정문 앞 오후 7시에 러닝 함께 하실 분 찾고 있습니다.\n저도 러닝을 잘하지 못해서 초보분들과 함께 운동하고 싶습니다. 많이 참여해주세요~^^',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                Divider(),
                SizedBox(height: 240),
                Row(
                  children: [
                    Container(
                      width: 280,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.black38,
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showParticipationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 3,
              maxWidth: MediaQuery.of(context).size.width * 3,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text('보증금 1,000 포인트가 차감됩니다',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        )
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Text(
                  '건강한 운동 문화를 위해 보증금 제도를 운영하고 있습니다. 운동 약속 후 보증금은 자동반환 됩니다. 단, 문제 발생 시 반환되지 않습니다.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(120, 40),
                        backgroundColor: Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('취소', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('확인 및 참여', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          isParticipated = true;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTag(String text) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),// 테두리 색상을 회색으로 설정
          width: 1, // 테두리 두께 설정 (필요에 따라 조정 가능)
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: Colors.black),
      ),
    );
  }

  Widget _buildParticipant(String name, String comment, int likes, String imagePath) {
    return ListTile(
        contentPadding: EdgeInsets.only(right: 30),
        leading: ClipOval(
          child: Image.asset(
            imagePath, // 여기에서 전달받은 이미지 경로를 사용합니다.
            width: 40, // CircleAvatar의 radius 20에 해당하는 크기
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        subtitle: Text(comment, style: TextStyle(fontSize: 12)),
        trailing: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('좋아요 $likes',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        )

    );
  }
}
