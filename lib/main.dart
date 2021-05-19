import 'package:flutter/material.dart';
import 'front_page.dart';

void main() => runApp(CryptoApp());

class CryptoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FrontPage(),
    );
  }
}
