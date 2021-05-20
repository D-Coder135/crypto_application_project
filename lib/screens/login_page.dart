import 'package:demo_crypto_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
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
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 25.0),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Welcome! Sign in to your account to continue =>',
                      style: TextStyle(
                        color: Color(0xFF323232),
                        fontSize: 30.0,
                        fontFamily: 'NunitoSans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SignInButton(Buttons.GoogleDark, onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                }),
                SignInButton(Buttons.Facebook, onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                }),
                Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansJP',
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email address',
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w400,
                          ),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(10.0),
                                  right: Radius.circular(10.0))),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w400,
                          ),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(10.0),
                                  right: Radius.circular(10.0))),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.all(10.0),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSansJP',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                          );
                        },
                        child: CircleAvatar(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                          backgroundColor: Color(0xFFFA6400),
                          radius: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
