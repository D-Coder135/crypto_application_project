import 'package:demo_crypto_app/subscribed_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubscribedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SubscribedData>(
      builder: (context, subscribedData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final currency = subscribedData.currencies[index];
          },
        );
      },
    );
  }
}
