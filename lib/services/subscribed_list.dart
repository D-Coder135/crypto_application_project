import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_crypto_app/services/reusable_card.dart';
import 'package:demo_crypto_app/services/subscribed_data.dart';
import 'package:demo_crypto_app/services/subscribed_widget.dart';
import 'package:flutter/material.dart';

class SubscribedList extends StatelessWidget {
  final uid = SubscribedData().getCurrentUID();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: SubscribedData()
            .firestore
            .collection("userData")
            .doc(uid)
            .collection("subscribedData")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading...!');
          }
          final subscribedData = snapshot.data.docs;
          List<SubscribedWidget> subscribedList = [];
          for (var data in subscribedData) {
            final id = data.id;
            final name = data.get('name');
            final imageFile = data.get('imageFileName');
            final rateInUSD = data.get('rateInUSD');
            final rateInINR = data.get('rateInINR');

            final subscribedDataObject =
                SubscribedWidget(name, imageFile, rateInUSD, rateInINR, () {
              final doc = SubscribedData()
                  .firestore
                  .collection("userData")
                  .doc(uid)
                  .collection("subscribedData")
                  .doc(id);
              doc.delete();
            });
            // final subscribedDataObject = ReusableCard(colour,
            //     imageFileName,
            //     text,
            //     letterSpacingValue,
            //     marginValue,
            //     textForUSDRate,
            //     colorForTextUSD,
            //     textForINRRate, co
            //     lorForTextINR)
            subscribedList.add(subscribedDataObject);
          }
          return ListView(
            shrinkWrap: true,
            children: subscribedList,
          );
        });
  }
}
