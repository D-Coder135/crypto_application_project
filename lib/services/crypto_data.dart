import 'package:demo_crypto_app/services/networking.dart';
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
  'qtum',
  'husd',
  'zcash',
];

class CryptoData {
  get cryptoList {
    return cryptoCurrenciesList;
  }

  Future<dynamic> getCryptoData(int index) async {
    NetworkHelper networkHelper =
        NetworkHelper('$coinCapURL/${cryptoCurrenciesList[index]}');
    var currencyData = await networkHelper.getData();
    return currencyData;
  }
}
