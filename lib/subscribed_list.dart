import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_crypto_app/subscribed_data.dart';
import 'package:demo_crypto_app/subscribed_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            return CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            );
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
            subscribedList.add(subscribedDataObject);
          }
          return Expanded(
            child: ListView(
              children: subscribedList,
            ),
          );
        });
  }
}

// Consumer<SubscribedData>(
// builder: (context, subscribedData, child) {
// return ListView.builder(
// itemBuilder: (context, index) {
// final currency = subscribedData.subscribedCurrencies[index];
// return SubscribedWidget(currency.currencyName, currency.imageFile,
// currency.rateInUSD, currency.rateInINR, () {
// subscribedData.deleteCurrency(currency);
// });
// },
// itemCount: subscribedData.currenciesCount,
// );
// },
// );
