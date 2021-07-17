import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SubscribedData extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;

  get firestore => _firestore;
  final _auth = FirebaseAuth.instance;

  String getCurrentUID() {
    return (_auth.currentUser).uid;
  }

  // List<Currency> _subscribedCurrencies = [];
  //
  // List<Currency> get subscribedCurrencies => _subscribedCurrencies;

  // int get currenciesCount {
  //   return _subscribedCurrencies.length;
  // }

  void addCurrency(
      String name, String imageFile, String rateInUSD, String rateInINR) {
    // final currency = Currency(name, imageFile, rateInUSD, rateInINR);

    final uid = getCurrentUID();

    _firestore
        .collection("userData")
        .doc(uid)
        .collection("subscribedData")
        .add({
      'name': name,
      'imageFileName': imageFile,
      'rateInUSD': rateInUSD,
      'rateInINR': rateInINR
    });

    // _subscribedCurrencies.add(currency);
    notifyListeners();
  }

  // void deleteCurrency(Currency currency) {
  //   _subscribedCurrencies.remove(currency);
  //   notifyListeners();
  // }
}
