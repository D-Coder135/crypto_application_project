import 'package:demo_crypto_app/screens/login_page.dart';
import 'package:demo_crypto_app/screens/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomePage extends StatelessWidget {
  static const String id = 'Welcome_Screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Column(
            //   children: <Widget>[
            //     Expanded(
            //       child: Container(
            //         margin: EdgeInsets.only(top: 25.0),
            //         alignment: Alignment.topLeft,
            //         padding: EdgeInsets.only(left: 10.0),
            //         child: Text(
            //           'Welcome! Sign in to your account to continue =>',
            //           style: TextStyle(
            //             color: Color(0xFF323232),
            //             fontSize: 30.0,
            //             fontFamily: 'NunitoSans',
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //     ),
            //     Text(
            //       'OR',
            //       style: TextStyle(
            //         fontSize: 20.0,
            //         fontWeight: FontWeight.bold,
            //         fontFamily: 'NotoSansJP',
            //       ),
            //     ),
            //     Column(
            //       children: [
            //         Container(
            //           margin: EdgeInsets.all(10.0),
            //           padding: EdgeInsets.only(left: 10.0, right: 10.0),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               filled: true,
            //               fillColor: Colors.white,
            //               hintText: 'Email address',
            //               hintStyle: TextStyle(
            //                 color: Colors.grey[600],
            //                 fontFamily: 'NunitoSans',
            //                 fontWeight: FontWeight.w400,
            //               ),
            //               border: UnderlineInputBorder(
            //                   borderRadius: BorderRadius.horizontal(
            //                       left: Radius.circular(10.0),
            //                       right: Radius.circular(10.0))),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           margin: EdgeInsets.all(10.0),
            //           padding: EdgeInsets.only(left: 10.0, right: 10.0),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               filled: true,
            //               fillColor: Colors.white,
            //               hintText: 'Password',
            //               hintStyle: TextStyle(
            //                 color: Colors.grey[600],
            //                 fontFamily: 'NunitoSans',
            //                 fontWeight: FontWeight.w400,
            //               ),
            //               border: UnderlineInputBorder(
            //                   borderRadius: BorderRadius.horizontal(
            //                       left: Radius.circular(10.0),
            //                       right: Radius.circular(10.0))),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //     Row(
            //       children: <Widget>[
            //         Expanded(
            //           flex: 3,
            //           child: Container(
            //             padding: EdgeInsets.all(10.0),
            //             margin: EdgeInsets.all(10.0),
            //             child: Text(
            //               'Sign in',
            //               style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 25.0,
            //                 fontWeight: FontWeight.bold,
            //                 fontFamily: 'NotoSansJP',
            //               ),
            //             ),
            //           ),
            //         ),
            //         Expanded(
            //           child: GestureDetector(
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) {
            //                     return HomePage();
            //                   },
            //                 ),
            //               );
            //             },
            //             child: CircleAvatar(
            //               child: Icon(
            //                 Icons.arrow_forward_ios,
            //                 color: Colors.white,
            //               ),
            //               backgroundColor: Color(0xFFFA6400),
            //               radius: 40.0,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: Container(
                          child: Image.asset('images/bitcoin.png'),
                          height: 70.0,
                        ),
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Welcome!',
                            textStyle: TextStyle(
                              // color: Colors.black,
                              fontSize: 45.0,
                              fontWeight: FontWeight.w900,
                            ),
                            speed: Duration(milliseconds: 150),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      elevation: 5.0,
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        onPressed: () {
                          //Go to login screen.
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          'Log In',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(30.0),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          //Go to registration screen.
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          'Register',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
