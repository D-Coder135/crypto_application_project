import 'dart:developer';

import 'package:demo_crypto_app/services/networking.dart';
import 'package:demo_crypto_app/services/reusable_card.dart';
import 'package:flutter/cupertino.dart';

const coinCapURL = 'https://api.coincap.io/v2/assets';

const List<String> cryptoCurrenciesList = [
  'bitcoin',
  'ethereum',
  // 'usd-coin',
  'litecoin',
  'dash',
  'bitcoin-cash',
  'tether',
  'binance-coin',
  'eos',
  'multi-collateral-dai',
  'waves',
  'dogecoin',
  'qtum',
  // 'husd',
  'zcash',
];


class CryptoData {
  List<int> ratesList;
  List<CoinModel> list = [];
  Future<void> getCryptoData() async {
    ratesList = [];
    // for (int index = 0; index < cryptoCurrenciesList.length; index++) {
    //   NetworkHelper networkHelper =
    //       NetworkHelper('$coinCapURL/${cryptoCurrenciesList[index]}');
    //   log(cryptoCurrenciesList[index].toString());
    //   var currencyData = await networkHelper.getData();
    //   log(currencyData.toString());
    //   log("end");
    //   var currentRateInString = currencyData['data']['priceUsd'];
    //   if(currentRateInString != null)
    //   ratesList.add(double.parse(currentRateInString).toInt());
    // }
    // ratesList = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

    NetworkHelper networkHelper =
          NetworkHelper('$coinCapURL');
    var currencyData = await networkHelper.getData();
      log(currencyData['data'][0]['id'].toString());

      for(int i = 0; i < currencyData['data'].length; i++){
        // log(currencyData[i].toString());

          list.add(new CoinModel(name: currencyData['data'][i]['id'], price: currencyData['data'][i]['priceUsd']));
      }

      for(String name in cryptoCurrenciesList){
        for(CoinModel cmd in list){
          if(cmd.name == name){
            ratesList.add(double.parse(cmd.price).toInt());
          }
        }
      }
      // log(list.toString());


    // void updateSubscribedCrypto(ReusableCard currency) {
    //   currency.toggleSubscribed();
    // }
  }
}

class CoinModel{
  String name;
  String price;
  CoinModel({@required this.name, @required this.price});
}
