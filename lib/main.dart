import 'package:flutter/material.dart';
import 'screens/front_page.dart';

void main() => runApp(CryptoApp());

class CryptoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FrontPage(),
      routes: {
        FrontPage.id: (context) => FrontPage();
      },
    );
  }
}
