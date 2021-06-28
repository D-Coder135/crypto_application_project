import 'package:demo_crypto_app/screens/crypto_list_page.dart';
import 'package:demo_crypto_app/subscribed_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  static const String id = 'Home_Page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF443CA2),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFA443CA2),
        onPressed: () {
          Navigator.pushNamed(context, CryptoList.id);
        },
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 130.0, bottom: 100.0),
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText(
                    "Subscribed Currencies!",
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: 'Marker',
                      fontWeight: FontWeight.w500,
                    ),
                    speed: Duration(
                      milliseconds: 90,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: SubscribedList(),
            ),
          ),
        ],
      ),
    );
  }
}
