import 'package:demo_crypto_app/networking.dart';

const coinCapURL = 'https://api.coincap.io/v2/rates';

List<String> cryptoCurrenciesList = [];

class CryptoData {
  Future<dynamic> getCryptoData(var selectedCurrency) async {
    NetworkHelper networkHelper =
        NetworkHelper('$coinCapURL/$selectedCurrency');
    var currencyData = await networkHelper.getData();
    return currencyData;
  }
}
