import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SubscribedWidget extends StatelessWidget {
  final String currencyName;
  final String imageFile;
  final String rateInUSD;
  final String rateInINR;
  final void Function() unsubscribeCurrency;

  SubscribedWidget(this.currencyName, this.imageFile, this.rateInUSD,
      this.rateInINR, this.unsubscribeCurrency);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        // margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Color(0xFA443CA2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(imageFile),
                  radius: 22.2,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      currencyName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Farro',
                        letterSpacing: 0.0,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 5.0, right: 45.0),
                      child: Text(
                        '$rateInUSD',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Text(
                '$rateInINR',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              child: Text(
                'Unsubscribe',
                style: TextStyle(color: Colors.white, fontSize: 10.0),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(0.0),
                ),
                backgroundColor: MaterialStateProperty.all(
                  Colors.red,
                ),
              ),
              onPressed: unsubscribeCurrency,
            ),
          ],
        ),
      ),
    );
  }
}