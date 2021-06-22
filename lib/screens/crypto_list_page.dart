import 'package:demo_crypto_app/services/reusable_card.dart';
import 'package:demo_crypto_app/services/crypto_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CryptoList extends StatefulWidget {
  static const String id = 'Crypto_list_Screen';

  @override
  _CryptoListState createState() => _CryptoListState();
}

class _CryptoListState extends State<CryptoList>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  var rateList;
  bool _loading;

  // var currentRateInUSDBitcoin;
  // var currentRateInUSDEthereum;
  // var currentRateInUSDUSDC;
  // var currentRateInUSDLiteCoin;
  // var currentRateInUSDDash;
  // var currentRateInINRBitcoin;
  // var currentRateInINREthereum;
  // var currentRateInINRUSDC;
  // var currentRateInINRLiteCoin;
  // var currentRateInINRDash;
  //
  // void getCurrentRate() async {
  //   try {
  //     for (int index = 0; index < cryptoCurrenciesList.length; index++) {
  //       var data = await CryptoData().getCryptoData(index);
  //       if (index == 0) {
  //         setState(() {
  //           var currentRateInUSDInString = data['data']['rateUsd'];
  //           currentRateInUSDBitcoin =
  //               double.parse(currentRateInUSDInString).toInt();
  //           currentRateInINRBitcoin = currentRateInUSDBitcoin * 72;
  //         });
  //       } else if (index == 1) {
  //         setState(() {
  //           var currentRateInUSDInString = data['data']['rateUsd'];
  //           currentRateInUSDEthereum =
  //               double.parse(currentRateInUSDInString).toInt();
  //           currentRateInINREthereum = currentRateInUSDEthereum * 72;
  //         });
  //       } else if (index == 2) {
  //         setState(() {
  //           var currentRateInUSDInString = data['data']['rateUsd'];
  //           currentRateInUSDUSDC =
  //               double.parse(currentRateInUSDInString).toInt();
  //           currentRateInINRUSDC = currentRateInUSDUSDC * 72;
  //         });
  //       } else if (index == 3) {
  //         setState(() {
  //           var currentRateInUSDInString = data['data']['rateUsd'];
  //           currentRateInUSDLiteCoin =
  //               double.parse(currentRateInUSDInString).toInt();
  //           currentRateInINRLiteCoin = currentRateInUSDLiteCoin * 72;
  //         });
  //       } else {
  //         setState(() {
  //           var currentRateInUSDInString = data['data']['rateUsd'];
  //           currentRateInUSDDash =
  //               double.parse(currentRateInUSDInString).toInt();
  //           currentRateInINRDash = currentRateInUSDDash * 72;
  //         });
  //       }
  //     }
  //   } catch (exception) {
  //     print(exception);
  //   }
  // }
  void getData() async {
    CryptoData data = CryptoData();
    await data.getCryptoData();
    rateList = data.ratesList;
  }

  @override
  void initState() {
    super.initState();
    // getCurrentRate();
    getData();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Live Data!',
          style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Farro',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Color(0xFFFCE5C9),
                  'images/Bitcoin.png',
                  'Bitcoin(BTC)',
                  2.0,
                  80.0,
                  '\$ ${rateList[0]}',
                  Color(0xFFF29726),
                  '₹ ${rateList[0] * 72}',
                  Color(0xFFF29726),
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Colors.lightBlueAccent[100],
                  'images/Ethereum.png',
                  'Ethereum(ETH)',
                  0.5,
                  100.0,
                  '\$ ${rateList[1]}',
                  Colors.lightBlue[700],
                  '₹ ${rateList[1] * 72}',
                  Colors.lightBlue[800],
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Color(0xFFF4D96B),
                  'images/usdcoin.jpg',
                  'USDCoin(USDC)',
                  2.5,
                  150.0,
                  '\$ ${rateList[2]}',
                  Colors.orange[700],
                  '₹ ${rateList[2] * 72}',
                  Colors.orange[800],
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Colors.purple[200],
                  'images/Litecoin.png',
                  'Litecoin(LTC)',
                  1.0,
                  90.0,
                  '\$ ${rateList[3]}',
                  Colors.purple[700],
                  '₹ ${rateList[3] * 72}',
                  Colors.purple[800],
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Color(0xFF416BA3),
                  'images/Dash.png',
                  'Dash(DAO)',
                  4.0,
                  90.0,
                  '\$ ${rateList[4]}',
                  Colors.indigo[800],
                  '₹ ${rateList[4] * 72}',
                  Colors.indigo[900],
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Color(0xAA0ABB8A),
                  'images/bitcoincash.png',
                  'Bitcoin-Cash(BCH)',
                  1.0,
                  150.0,
                  '\$',
                  Colors.green[600],
                  '₹',
                  Colors.green[700],
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Color(0xAAF75C1E),
                  'images/tether.png',
                  'Tether(USDT)',
                  2.0,
                  120.0,
                  '\$',
                  Colors.deepOrangeAccent[400],
                  '₹',
                  Colors.deepOrangeAccent[700],
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Color(0xAA063856),
                  'images/binanceCoin.png',
                  'Binance-Coin(BNB)',
                  1.0,
                  150.0,
                  '\$',
                  Colors.blueGrey[800],
                  '₹',
                  Colors.blueGrey[900],
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Color(0xFF424242),
                  'images/eos.png',
                  'EOS(EOSIO)',
                  4.0,
                  120,
                  '\$',
                  Colors.black54,
                  '₹',
                  Colors.black87,
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Color(0xFFF7A005),
                  'images/multi-collateral-dai.png',
                  'MultiCollateral-Dai(MCD)',
                  0.0,
                  120.0,
                  '\$',
                  Colors.orange[900],
                  '₹',
                  Colors.orange[900],
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Color(0xAA00007C),
                  'images/Waves.png',
                  'Waves(WAVES)',
                  3.0,
                  120.0,
                  '\$',
                  Colors.indigo[800],
                  '₹',
                  Colors.blue[900],
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Color(0xFFC59300),
                  'images/Dogecoin.png',
                  'Dogecoin(DOGE)',
                  2.0,
                  120.0,
                  '\$',
                  Colors.deepOrangeAccent[700],
                  '₹',
                  Colors.deepOrange[800],
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Colors.blue[800],
                  'images/Qtum.png',
                  'Quantum(QTUM)',
                  2.0,
                  120.0,
                  '\$',
                  Colors.indigo[900],
                  '₹',
                  Colors.indigo[900],
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Colors.blue,
                  'images/husd.png',
                  'HUSD',
                  4.0,
                  120.0,
                  '\$',
                  Colors.cyan[800],
                  '₹',
                  Colors.cyan[900],
                ),
              ),
              ScaleTransition(
                scale: animation,
                child: ReusableCard(
                  Colors.yellow[600],
                  'images/zcash.png',
                  'ZCash(ZEC)',
                  3.0,
                  120.0,
                  '\$',
                  Colors.amber[800],
                  '₹',
                  Colors.amber[900],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
