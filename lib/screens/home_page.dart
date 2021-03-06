import 'package:demo_crypto_app/screens/crypto_list_page.dart';
import 'package:demo_crypto_app/screens/login_page.dart';
import 'package:demo_crypto_app/services/subscribed_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  static const String id = 'Home_Page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

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
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 45.0, left: 300.0),
            child: Material(
              color: Color(0xFF443CA2),
              borderRadius: BorderRadius.circular(20.0),
              elevation: 5.0,
              child: MaterialButton(
                onPressed: () {
                  _auth.signOut();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Logged Out Successfully!"),
                  ));
                    Navigator.pushNamed(context, LoginPage.id);
                },
                minWidth: 60.0,
                height: 40.0,
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 12.0
                  ),
                ),
              ),
            ),
          ),
          Column(
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
                      WavyAnimatedText(
                        "Subscribed Currencies!",
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w700,
                        ),
                        speed: Duration(
                          milliseconds: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.50,
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
            ],
          ),
        ],
      ),
    );
  }
}
