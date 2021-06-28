import 'package:demo_crypto_app/subscribed_widget.dart';
import 'package:flutter/material.dart';

class SubscribedData extends ChangeNotifier {
  List<SubscribedWidget> _subscribedCurrencies = [
    SubscribedWidget('BitCoin', 'images/Bitcoin.png', 54000, 2654659)
  ];

  List<SubscribedWidget> get subscribedCurrencies => _subscribedCurrencies;
}
