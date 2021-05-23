import 'package:demo_crypto_app/reusable_card.dart';
import 'package:demo_crypto_app/services/crypto_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // // String selectedCurrency = 'bitcoin';
  // List<dynamic> currentRateInUSD = [];
  // List<dynamic> currentRateInINR = [];
  var currentRateInUSDBitcoin;
  var currentRateInUSDEthereum;
  var currentRateInUSDDogecoin;
  var currentRateInUSDLitecoin;
  var currentRateInUSDDash;
  var currentRateInINRBitcoin;
  var currentRateInINREthereum;

  void getCurrentRate() async {
    try {
      for (int index = 0; index < cryptoCurrenciesList.length; index++) {
        var data = await CryptoData().getCryptoData(index);
        if (index == 0) {
          setState(() {
            var currentRateInUSDInString = data['data']['rateUsd'];
            currentRateInUSDBitcoin =
                double.parse(currentRateInUSDInString).toInt();
          });
        } else if (index == 1) {
          setState(() {
            var currentRateInUSDInString = data['data']['rateUsd'];
            currentRateInUSDEthereum =
                double.parse(currentRateInUSDInString).toInt();
          });
        } else if (index == 2) {
          setState(() {
            var currentRateInUSDInString = data['data']['rateUsd'];
            currentRateInUSDDogecoin =
                double.parse(currentRateInUSDInString).toInt();
          });
        } else if (index == 3) {
          setState(() {
            var currentRateInUSDInString = data['data']['rateUsd'];
            currentRateInUSDLitecoin =
                double.parse(currentRateInUSDInString).toInt();
          });
        } else {
          setState(() {
            var currentRateInUSDInString = data['data']['rateUsd'];
            currentRateInUSDDash =
                double.parse(currentRateInUSDInString).toInt();
          });
        }

        // setState(() {
        //   var currentRateInUSDInString = data['data']['rateUsd'];
        //   currentRateInUSD.add(double.parse(currentRateInUSDInString).toInt());
        //   currentRateInINR.add(currentRateInUSD[index] * 72);
        // });
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
              child: ReusableCard(
                Colors.purple[200],
                'images/Litecoin.png',
                'Litecoin(LTC)',
                1.0,
                90.0,
                '\$ ${currentRateInUSD[3]}',
                Colors.purple[700],
                '₹ ${currentRateInINR[3]}',
                Colors.purple[800],
              ),
            ),
            Expanded(
              child: ReusableCard(
                Color(0xFF416BA3),
                'images/Dash.png',
                'Dash(DAO)',
                4.0,
                70.0,
                '\$ ${currentRateInUSD[4]}',
                Colors.indigo[800],
                '₹ ${currentRateInINR[4]}',
                Colors.indigo[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
