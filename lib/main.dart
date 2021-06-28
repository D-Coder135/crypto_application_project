import 'package:demo_crypto_app/screens/home_page.dart';
import 'package:demo_crypto_app/screens/crypto_list_page.dart';
import 'package:demo_crypto_app/screens/login_page.dart';
import 'package:demo_crypto_app/screens/registration_page.dart';
import 'package:demo_crypto_app/screens/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/front_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CryptoApp());
}

class CryptoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        initialRoute: FrontPage.id,
        routes: {
          FrontPage.id: (context) => FrontPage(),
          WelcomePage.id: (context) => WelcomePage(),
          LoginPage.id: (context) => LoginPage(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          HomePage.id: (context) => HomePage(),
          CryptoList.id: (context) => CryptoList(),
        },
      ),
    );
  }
}
