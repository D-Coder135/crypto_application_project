import 'package:demo_crypto_app/services/networking.dart';

const coinCapURL = 'https://api.coincap.io/v2/rates';

const List<String> cryptoCurrenciesList = [
  'bitcoin',
  'ethereum',
  'dogecoin',
  'litecoin',
  'dash',
  'bitcoin-cash',
  'tether',
  'binance-coin',
  'eos',
  'waves',
  'husd',
];

class CryptoData {
  Future<dynamic> getCryptoData(int index) async {
    NetworkHelper networkHelper =
        NetworkHelper('$coinCapURL/${cryptoCurrenciesList[index]}');
    var currencyData = await networkHelper.getData();
    return currencyData;
  }
}
