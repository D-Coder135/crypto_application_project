import 'package:demo_crypto_app/screens/crypto_list_page.dart';
import 'package:flutter/material.dart';

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
      // appBar: AppBar(
      //   backgroundColor: Colors.blueGrey[300],
      //   brightness: Brightness.light,
      //   title: Text(
      //     'Your Subscribed Currencies',
      //     style: TextStyle(
      //       fontSize: 18.0,
      //       color: Colors.blueGrey[900],
      //       fontWeight: FontWeight.bold,
      //       fontFamily: 'Farro',
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.blueGrey[500],
        onPressed: () {
          Navigator.pushNamed(context, CryptoList.id);
        },
      ),
      body: Expanded(),
    );
  }
}
