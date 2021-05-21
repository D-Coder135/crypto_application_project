import 'package:demo_crypto_app/crypto_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String selectedCurrency = 'bitcoin';
  List<dynamic> currentRateInUSD = [];
  List<dynamic> currentRateInINR = [];

  void getCurrentRate() async {
    try {
      for (int index = 0; index < cryptoCurrenciesList.length; index++) {
        var data = await CryptoData().getCryptoData(index);
        setState(() {
          var currentRateInUSDInString = data['data']['rateUsd'];
          currentRateInUSD.add(double.parse(currentRateInUSDInString).toInt());
          currentRateInINR.add(currentRateInUSD[index] * 72);
        });
      }
    } catch (exception) {
      print(exception);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentRate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD7E2F3),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Color(0xFFFCE5C9),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('images/Bitcoin.png'),
                      radius: 40.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Bitcoin(BTC)',
                          style: TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Farro',
                            letterSpacing: 2.0,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 5.0, right: 80.0),
                          child: Text(
                            '\$ ${currentRateInUSD[0]}',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Color(0xFFF29726),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '₹ ${currentRateInINR[0]}',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFF29726),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent[100],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('images/Ethereum.png'),
                      radius: 40.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Ethereum(ETH)',
                          style: TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Farro',
                            letterSpacing: 2.0,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 5.0, right: 100.0),
                          child: Text(
                            '\$ ${currentRateInUSD[1]}',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.lightBlue[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '₹ ${currentRateInINR[1]}',
                      style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.lightBlue[800]),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF4D96B),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('images/Dogecoin.png'),
                      radius: 40.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Dogecoin(DOGE)',
                          style: TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Farro',
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 5.0, right: 90.0),
                          child: Text(
                            '\$ ${currentRateInUSD[2]}',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.orange[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '₹ ${currentRateInINR[2]}',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.orange[800],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.purple[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('images/Litecoin.png'),
                      radius: 40.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Litecoin(LTC)',
                          style: TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Farro',
                            letterSpacing: 1.0,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 5.0, right: 90.0),
                          child: Text(
                            '\$ ${currentRateInUSD[3]}',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.purple[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '₹ ${currentRateInINR[3]}',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.purple[800],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color(0xFF416BA3),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('images/Dash.png'),
                      radius: 40.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Dash(DAO)',
                          style: TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Farro',
                            letterSpacing: 4.0,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 5.0, right: 70.0),
                          child: Text(
                            '\$ ${currentRateInUSD[4]}',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.indigo[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '₹ ${currentRateInINR[4]}',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.indigo[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
