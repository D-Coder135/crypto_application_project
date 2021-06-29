import 'package:demo_crypto_app/currency.dart';
import 'package:flutter/material.dart';

class SubscribedData extends ChangeNotifier {
  List<Currency> _subscribedCurrencies = [];

  List<Currency> get subscribedCurrencies => _subscribedCurrencies;

  int get currenciesCount {
    return _subscribedCurrencies.length;
  }

  void addCurrency(
      String name, String imageFile, String rateInUSD, String rateInINR) {
    final currency = Currency(name, imageFile, rateInUSD, rateInINR);
    _subscribedCurrencies.add(currency);
    notifyListeners();
  }

  void deleteCurrency() {}
}
