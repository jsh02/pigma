import 'package:flutter/material.dart';
import 'second.dart'; // Import the second.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => MainPage(), // Your main page widget
          );
        },
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 20),
            Image.asset(
              'lib/icon/logo.png', // Replace with the correct path to your image
              width: 200, // Adjust the width as needed
            ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                // Navigate to the SecondPage when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(315, 48),
                shape: RoundedRectangleBorder( // Set the border radius here
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              child: Text(
                '시작하기',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}