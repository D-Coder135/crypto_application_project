import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                    color: Color(0xFF323232),
                    fontSize: 50.0,
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email address',
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                  ),
                  border: UnderlineInputBorder(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
