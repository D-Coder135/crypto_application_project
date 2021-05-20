import 'package:demo_crypto_app/networking.dart';

const coinCapURL = 'https://api.coincap.io/v2/rates';

class CryptoData {
  Future<dynamic> getCryptoData(var selectedCurrency) async {
    NetworkHelper networkHelper =
        NetworkHelper('$coinCapURL/$selectedCurrency');
    var currencyData = await networkHelper.getData();
  }
}
