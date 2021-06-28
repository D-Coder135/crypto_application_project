import 'package:demo_crypto_app/currency.dart';
import 'package:demo_crypto_app/subscribed_widget.dart';
import 'package:flutter/material.dart';

class SubscribedData extends ChangeNotifier {
  List<Currency> _subscribedCurrencies = [
    Currency('BitCoin', 'images/Bitcoin.png', 54000, 2654659)
  ];

  List<SubscribedWidget> get currencies => _subscribedCurrencies;
}
