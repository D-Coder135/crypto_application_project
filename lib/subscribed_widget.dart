import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscribedWidget extends StatelessWidget {
  final String currencyName;
  final String imageFile;
  final int rateInUSD;
  final int rateInINR;

  SubscribedWidget(
      this.currencyName, this.imageFile, this.rateInUSD, this.rateInINR);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Expanded(
        child: Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color(0xFA443CA2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(imageFile),
                radius: 35.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    currencyName,
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Farro',
                      letterSpacing: 1.5,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 5.0, right: 45.0),
                    child: Text(
                      '\$ $rateInUSD',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                '₹ $rateInINR',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              Checkbox(value: true, onChanged: null)
            ],
          ),
        ),
      ),
    );
  }
}
