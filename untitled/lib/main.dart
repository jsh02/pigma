import 'package:flutter/material.dart';

void main() {
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
      return MaterialApp(
         home: Scaffold(
            body: Center(
               child: SizedBox(
                  width: 300,
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                        Container(
                           height: 50,
                           width: 250,
                           alignment: Alignment.center,
                           child: Text("아이디를 입력해주세요"),
                        ),
                        Container(
                           height: 50,
                           width: 250,
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                              border: Border.all(
                                 color: Colors.red,
                              ),
                           ),
                           child: Text('비밀번호를 입력해주세요'),
                        ),
                        SizedBox(height: 120),
                        Container(
                           height: 50,
                           width: 250,
                           decoration: BoxDecoration(
                              border: Border.all(
                                 color: Colors.red,
                              ),
                           ),
                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.blue,
                                 )
                              ],
                           ),
                        ),
                     ],
                  ),
               ),
            ),
         ),
      );
   }
}