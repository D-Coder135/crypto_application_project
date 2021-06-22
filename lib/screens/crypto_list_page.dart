import 'package:demo_crypto_app/services/reusable_card.dart';
import 'package:demo_crypto_app/services/crypto_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    setState(() {
      _loading = true;
    });
    await data.getCryptoData();
    rateList = data.ratesList;
    setState(() {
      _loading = false;
    });
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
      body: _loading
          ? SpinKitChasingDots(
              color: Colors.blue,
              size: 100.0,
            )
          : Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ScaleTransition(
                  scale: animation,
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ReusableCard(
                        Color(0xFFFCE5C9),
                        'images/Bitcoin.png',
                        'Bitcoin(BTC)',
                        2.0,
                        70.0,
                        '\$ ${rateList[0]}',
                        Color(0xFFF29726),
                        '₹ ${rateList[0] * 72}',
                        Color(0xFFF29726),
                      ),
                      ReusableCard(
                        Colors.lightBlueAccent[100],
                        'images/Ethereum.png',
                        'Ethereum(ETH)',
                        0.5,
                        80.0,
                        '\$ ${rateList[1]}',
                        Colors.lightBlue[700],
                        '₹ ${rateList[1] * 72}',
                        Colors.lightBlue[800],
                      ),
                      ReusableCard(
                        Color(0xFFF4D96B),
                        'images/usdcoin.jpg',
                        'USDCoin(USDC)',
                        2.5,
                        140.0,
                        '\$ ${rateList[2]}',
                        Colors.orange[700],
                        '₹ ${rateList[2] * 72}',
                        Colors.orange[800],
                      ),
                      ReusableCard(
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
                      ReusableCard(
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
                      ReusableCard(
                        Color(0xAA0ABB8A),
                        'images/bitcoincash.png',
                        'Bitcoin-Cash(BCH)',
                        1.0,
                        150.0,
                        '\$ ${rateList[5]}',
                        Colors.green[600],
                        '₹ ${rateList[5] * 72}',
                        Colors.green[700],
                      ),
                      ReusableCard(
                        Color(0xAAF75C1E),
                        'images/tether.png',
                        'Tether(USDT)',
                        2.0,
                        120.0,
                        '\$ ${rateList[6]}',
                        Colors.deepOrangeAccent[400],
                        '₹ ${rateList[6] * 72}',
                        Colors.deepOrangeAccent[700],
                      ),
                      ReusableCard(
                        Color(0xAA063856),
                        'images/binanceCoin.png',
                        'Binance-Coin(BNB)',
                        1.0,
                        150.0,
                        '\$ ${rateList[7]}',
                        Colors.blueGrey[800],
                        '₹ ${rateList[7] * 72}',
                        Colors.blueGrey[900],
                      ),
                      ReusableCard(
                        Color(0xFF424242),
                        'images/eos.png',
                        'EOS(EOSIO)',
                        4.0,
                        120,
                        '\$ ${rateList[8]}',
                        Colors.black54,
                        '₹ ${rateList[8] * 72}',
                        Colors.black87,
                      ),
                      ReusableCard(
                        Color(0xFFF7A005),
                        'images/multi-collateral-dai.png',
                        'MultiCollateral-Dai(MCD)',
                        0.0,
                        120.0,
                        '\$ ${rateList[9]}',
                        Colors.orange[900],
                        '₹ ${rateList[9] * 72}',
                        Colors.orange[900],
                      ),
                      ReusableCard(
                        Color(0xAA00007C),
                        'images/Waves.png',
                        'Waves(WAVES)',
                        3.0,
                        120.0,
                        '\$ ${rateList[10]}',
                        Colors.indigo[800],
                        '₹ ${rateList[10] * 72}',
                        Colors.blue[900],
                      ),
                      ReusableCard(
                        Color(0xFFC59300),
                        'images/Dogecoin.png',
                        'Dogecoin(DOGE)',
                        2.0,
                        120.0,
                        '\$ ${rateList[11]}',
                        Colors.deepOrangeAccent[700],
                        '₹ ${rateList[11] * 72}',
                        Colors.deepOrange[800],
                      ),
                      ReusableCard(
                        Colors.blue[800],
                        'images/Qtum.png',
                        'Quantum(QTUM)',
                        2.0,
                        120.0,
                        '\$ ${rateList[12]}',
                        Colors.indigo[900],
                        '₹ ${rateList[12] * 72}',
                        Colors.indigo[900],
                      ),
                      ReusableCard(
                        Colors.blue,
                        'images/husd.png',
                        'HUSD',
                        4.0,
                        120.0,
                        '\$ ${rateList[13]}',
                        Colors.cyan[800],
                        '₹ ${rateList[13] * 72}',
                        Colors.cyan[900],
                      ),
                      ReusableCard(
                        Colors.yellow[600],
                        'images/zcash.png',
                        'ZCash(ZEC)',
                        3.0,
                        120.0,
                        '\$ ${rateList[14]}',
                        Colors.amber[800],
                        '₹ ${rateList[14] * 72}',
                        Colors.amber[900],
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
