import 'package:flutter/material.dart';

import 'Meeting_join.dart';

class ExerciseListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
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
        child: ListView(
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/map.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildPlaceInfo(),
            Divider(),
            _buildTabBar(),
            Divider(
              color: Colors.grey[300],
            ),
            _buildListItem(context, '한국외대 정문 앞 19시 같이 러닝할 사람!!', 'D-1'),
            Divider(
              color: Colors.grey[300],
            ),
            _buildListItem(context, '한국외대 정문 앞 19시 같이 러닝할 사람!!', 'D-2'),
            Divider(
              color: Colors.grey[300],
            ),
            _buildListItem(context, '한국외대 정문 앞 19시 같이 러닝할 사람!!', 'D-3'),
            Divider(
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceInfo() {
    return ListTile(
      leading: ClipOval(
        child: Image.asset(
          'lib/images/park.png', // 여기에 이미지 경로를 입력하세요.
          width: 40, // CircleAvatar의 radius 20에 해당하는 크기
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
          '모현 공원',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
      ),
      subtitle: Text(
          '용인시 모현읍 외대로81',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[500],
      ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Row(
        children: [
          Text('모집 중인 약속', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
          SizedBox(width: 16),
          Text(
              '장소 정보',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[500],
            ),
          ),
          SizedBox(width: 16),
          Text(
              '리뷰',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title, String daysLeft) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MeetingJoinPage()),
        );
      },
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '#한국외대 #러닝 #초보 #4명',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
            Text(
              '좋아요 13  인원 1/4',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
          ]
        ),


        trailing:
            Text(daysLeft, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ),
    );
  }
}

