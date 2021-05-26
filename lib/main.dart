import 'package:demo_crypto_app/home_page.dart';
import 'package:demo_crypto_app/screens/crypto_list_page.dart';
import 'package:demo_crypto_app/screens/registration_page.dart';
import 'package:demo_crypto_app/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'screens/front_page.dart';

void main() => runApp(CryptoApp());

class CryptoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FrontPage.id,
      routes: {
        FrontPage.id: (context) => FrontPage(),
        WelcomePage.id: (context) => WelcomePage(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomePage.id: (context) => HomePage(),
        CryptoList.id: (context) => CryptoList(),
      },
    );
  }
}
