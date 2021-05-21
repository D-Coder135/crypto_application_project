import 'package:demo_crypto_app/reusable_card.dart';
import 'package:demo_crypto_app/services/crypto_data.dart';
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
              child: ReusableCard(
                Color(0xFFFCE5C9),
                'images/Bitcoin.png',
                'Bitcoin(BTC)',
                2.0,
                80.0,
                '\$ ${currentRateInUSD[0]}',
                Color(0xFFF29726),
                '₹ ${currentRateInINR[0]}',
                Color(0xFFF29726),
              ),
            ),
            Expanded(
              child: ReusableCard(
                Colors.lightBlueAccent[100],
                'images/Ethereum.png',
                'Ethereum(ETH)',
                2.0,
                100.0,
                '\$ ${currentRateInUSD[1]}',
                Colors.lightBlue[700],
                '₹ ${currentRateInINR[1]}',
                Colors.lightBlue[800],
              ),
            ),
            Expanded(
              child: ReusableCard(
                Color(0xFFF4D96B),
                'images/Dogecoin.png',
                'Dogecoin(DOGE)',
                2.0,
                150.0,
                '\$ ${currentRateInUSD[2]}',
                Colors.orange[700],
                '₹ ${currentRateInINR[2]}',
                Colors.orange[800],
              ),
            ),
            Expanded(
                // child: Container(
                //   margin: EdgeInsets.all(20.0),
                //   decoration: BoxDecoration(
                //     color: Colors.purple[200],
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: <Widget>[
                //       CircleAvatar(
                //         backgroundImage: AssetImage('images/Litecoin.png'),
                //         radius: 40.0,
                //       ),
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: <Widget>[
                //           Text(
                //             'Litecoin(LTC)',
                //             style: TextStyle(
                //               fontSize: 21.0,
                //               fontWeight: FontWeight.bold,
                //               fontFamily: 'Farro',
                //               letterSpacing: 1.0,
                //             ),
                //           ),
                //           Container(
                //             alignment: Alignment.centerLeft,
                //             margin: EdgeInsets.only(top: 5.0, right: 90.0),
                //             child: Text(
                //               '\$ ${currentRateInUSD[3]}',
                //               style: TextStyle(
                //                 fontSize: 17.0,
                //                 color: Colors.purple[700],
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       Text(
                //         '₹ ${currentRateInINR[3]}',
                //         style: TextStyle(
                //           fontSize: 19.0,
                //           fontWeight: FontWeight.w900,
                //           color: Colors.purple[800],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
