import 'package:demo_crypto_app/screens/login_page.dart';
import 'package:demo_crypto_app/screens/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomePage extends StatefulWidget {
  static const String id = 'Welcome_Screen';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
  }

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
                          height: 75.0,
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
                    height: 40.0,
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
