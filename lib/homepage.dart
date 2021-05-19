import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 450.0),
              color: Color(0xFF4037AB),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('images/pic.png'),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'My Portfolio',
                    style: TextStyle(
                        color: Color(0xFFACACAC),
                        fontSize: 15.0,
                        fontFamily: 'ArchitectsDaughter',
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    '\$420,050',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontFamily: 'NotoSansJP',
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
