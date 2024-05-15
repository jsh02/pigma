import 'package:flutter/material.dart';
import '../main.dart';


class Page32 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80),
            Text(
              '한눈에 보기 쉬운',

              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              '지도 기반 서비스',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 125),
            Image.asset(
              'lib/icon/map32.png',
              width: 200,
            ), // Static map image
            ],
        ),
      )
    );
  }

}
