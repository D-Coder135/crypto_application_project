import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xAAD3F0FF),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        brightness: Brightness.light,
      ),
    );
  }
}
