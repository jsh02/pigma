import 'package:flutter/material.dart';

class Page34 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Page 34',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'This is the first page of the PageView.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}