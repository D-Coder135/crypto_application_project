import 'dart:ffi';

import 'package:demo_crypto_app/services/networking.dart';
import 'package:demo_crypto_app/services/reusable_card.dart';
import 'package:flutter/material.dart';

const coinCapURL = 'https://api.coincap.io/v2/rates';

const List<String> cryptoCurrenciesList = [
  'bitcoin',
  'ethereum',
  'usd-coin',
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
  'husd',
  'zcash',
];

class CryptoData {
  List<int> ratesList = [];
  List<ReusableCard> _subscribedCrypto;

  Future<void> getCryptoData() async {
    for (int index = 0; index < cryptoCurrenciesList.length; index++) {
      NetworkHelper networkHelper =
          NetworkHelper('$coinCapURL/${cryptoCurrenciesList[index]}');
      var currencyData = await networkHelper.getData();
      var currentRateInString = currencyData['data']['rateUsd'];
      ratesList.add(double.parse(currentRateInString).toInt());
    }
  }
}
