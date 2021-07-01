import 'package:demo_crypto_app/screens/home_page.dart';
import 'package:demo_crypto_app/subscribed_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final String imageFileName;
  final String text;
  final double letterSpacingValue;
  final double marginValue;
  final String textForUSDRate;
  final Color colorForTextUSD;
  final String textForINRRate;
  final Color colorForTextINR;

  ReusableCard(
    this.colour,
    this.imageFileName,
    this.text,
    this.letterSpacingValue,
    this.marginValue,
    this.textForUSDRate,
    this.colorForTextUSD,
    this.textForINRRate,
    this.colorForTextINR,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(imageFileName),
              radius: 35.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Farro',
                    letterSpacing: letterSpacingValue,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 5.0, right: marginValue),
                  child: Text(
                    textForUSDRate,
                    style: TextStyle(
                      fontSize: 17.0,
                      color: colorForTextUSD,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              textForINRRate,
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w900,
                color: colorForTextINR,
              ),
            ),
            TextButton(
              child: Text(
                'Subscribe',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.red,
                ),
              ),
              onPressed: () {
                Provider.of<SubscribedData>(context, listen: false).addCurrency(
                    text, imageFileName, textForUSDRate, textForINRRate);
                Navigator.pushNamed(context, HomePage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
