import 'package:flutter/cupertino.dart';

class SubscribedWidget extends StatelessWidget {
  final String currencyName;
  final String imageFile;
  final int rateInUSD;
  final int rateInINR;

  SubscribedWidget(
      this.currencyName, this.imageFile, this.rateInUSD, this.rateInINR);

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
