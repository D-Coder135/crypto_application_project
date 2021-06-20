import 'package:demo_crypto_app/services/reusable_card.dart';
import 'package:demo_crypto_app/services/crypto_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CryptoList extends StatefulWidget {
  static const String id = 'Crypto_list_Screen';

  @override
  _CryptoListState createState() => _CryptoListState();
}

class _CryptoListState extends State<CryptoList> {
  var currentRateInUSDBitcoin;
  var currentRateInUSDEthereum;
  var currentRateInUSDUSDC;
  var currentRateInUSDLiteCoin;
  var currentRateInUSDDash;
  var currentRateInINRBitcoin;
  var currentRateInINREthereum;
  var currentRateInINRUSDC;
  var currentRateInINRLiteCoin;
  var currentRateInINRDash;

  void getCurrentRate() async {
    try {
      for (int index = 0; index < cryptoCurrenciesList.length; index++) {
        var data = await CryptoData().getCryptoData(index);
        if (index == 0) {
          setState(() {
            var currentRateInUSDInString = data['data']['rateUsd'];
            currentRateInUSDBitcoin =
                double.parse(currentRateInUSDInString).toInt();
            currentRateInINRBitcoin = currentRateInUSDBitcoin * 72;
          });
        } else if (index == 1) {
          setState(() {
            var currentRateInUSDInString = data['data']['rateUsd'];
            currentRateInUSDEthereum =
                double.parse(currentRateInUSDInString).toInt();
            currentRateInINREthereum = currentRateInUSDEthereum * 72;
          });
        } else if (index == 2) {
          setState(() {
            var currentRateInUSDInString = data['data']['rateUsd'];
            currentRateInUSDUSDC =
                double.parse(currentRateInUSDInString).toInt();
            currentRateInINRUSDC = currentRateInUSDUSDC * 72;
          });
        } else if (index == 3) {
          setState(() {
            var currentRateInUSDInString = data['data']['rateUsd'];
            currentRateInUSDLiteCoin =
                double.parse(currentRateInUSDInString).toInt();
            currentRateInINRLiteCoin = currentRateInUSDLiteCoin * 72;
          });
        } else {
          setState(() {
            var currentRateInUSDInString = data['data']['rateUsd'];
            currentRateInUSDDash =
                double.parse(currentRateInUSDInString).toInt();
            currentRateInINRDash = currentRateInUSDDash * 72;
          });
        }
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
      appBar: AppBar(
        title: Text(
          'Live Data',
          style: TextStyle(
            color: Colors.blueGrey[600],
            fontFamily: 'Farro',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[350],
      ),
      // backgroundColor: Color(0xFFD7E2F3),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              Color(0xFFFCE5C9),
              'images/Bitcoin.png',
              'Bitcoin(BTC)',
              2.0,
              80.0,
              '\$ $currentRateInUSDBitcoin',
              Color(0xFFF29726),
              '₹ $currentRateInINRBitcoin',
              Color(0xFFF29726),
            ),
          ),
          Expanded(
            child: ReusableCard(
              Colors.lightBlueAccent[100],
              'images/Ethereum.png',
              'Ethereum(ETH)',
              2.0,
              120.0,
              '\$ $currentRateInUSDEthereum',
              Colors.lightBlue[700],
              '₹ $currentRateInINREthereum',
              Colors.lightBlue[800],
            ),
          ),
          Expanded(
            child: ReusableCard(
              Color(0xFFF4D96B),
              'images/usdcoin.jpg',
              'USDCoin(USDC)',
              3.0,
              160.0,
              '\$ $currentRateInUSDUSDC',
              Colors.orange[700],
              '₹ $currentRateInINRUSDC',
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
              '\$ $currentRateInUSDLiteCoin',
              Colors.purple[700],
              '₹ $currentRateInINRLiteCoin',
              Colors.purple[800],
            ),
          ),
          Expanded(
            child: ReusableCard(
              Color(0xFF416BA3),
              'images/Dash.png',
              'Dash(DAO)',
              4.0,
              90.0,
              '\$ $currentRateInUSDDash',
              Colors.indigo[800],
              '₹ $currentRateInINRDash',
              Colors.indigo[900],
            ),
          ),
        ],
      ),
    );
  }
}
