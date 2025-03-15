import 'package:bitcoin_ticker/services/network.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList=[
  'BTC',
  'ETH',
  'LTC',
];


class CoinData{
  Future<dynamic> getCryptoExRate(String selectedQuoteCurrency) async {
    Map<String, String> cryptoPrices = {};
    Uri url;
    double price;
    for(String crypto in cryptoList){
      url = Uri.parse('${dotenv.env['openExRateURL']}/$crypto/$selectedQuoteCurrency?apikey=${dotenv.env['APIKey']}');
      var networkHelper = NetworkHelper(url: url);
      var data = await networkHelper.getExRateData();
      price = data['rate'];
      cryptoPrices[crypto] = price.toStringAsFixed(0);
    }
    return cryptoPrices;
  }
}