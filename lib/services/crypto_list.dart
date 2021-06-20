import 'package:demo_crypto_app/services/crypto_data.dart';
import 'package:demo_crypto_app/services/reusable_card.dart';
import 'package:flutter/material.dart';

class CryptoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final cryptoTile = CryptoData().cryptoList[index];
        return ReusableCard(colour, imageFileName, text, letterSpacingValue, marginValue, textForUSDRate, colorForTextUSD, textForINRRate, colorForTextINR)
      },
    );
  }
}
