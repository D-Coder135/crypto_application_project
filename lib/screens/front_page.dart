import 'package:demo_crypto_app/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Image(
                  image: AssetImage('images/bitcoin.png'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(left: 40.0, right: 40.0),
                child: Column(
                  children: [
                    Text(
                      'Plan for the future',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF262163),
                          fontSize: 30.0,
                          fontFamily: 'NotoSansJP',
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'from now on',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF262163),
                          fontSize: 30.0,
                          fontFamily: 'NotoSansJP',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'We provide guidance regarding stock and crypto currencies investing.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFACACAC),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        );
                      },
                      child: CircleAvatar(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        backgroundColor: Color(0xFFF87B59),
                        radius: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
