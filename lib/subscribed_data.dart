import 'package:demo_crypto_app/currency.dart';
import 'package:flutter/material.dart';

class SubscribedData extends ChangeNotifier {
  List<Currency> _subscribedCurrencies = [
    Currency('BitCoin', 'images/Bitcoin.png', 54000, 2654659)
  ];

  List<Currency> get subscribedCurrencies => _subscribedCurrencies;

  void addCurrency(
      String name, String imageFile, String rateInUSD, String rateInINR) {
    final currency = Currency(name, imageFile, double.parse(rateInUSD).toInt(),
        double.parse(rateInINR).toInt());
    _subscribedCurrencies.add(currency);
    notifyListeners();
  }
}
