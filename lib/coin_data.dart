import 'package:bitcoin_ticker/services/network.dart';

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

const openExRateURL = 'https://rest.coinapi.io/v1/exchangerate';
const APIKey = 'e4e00177-9aec-4d80-a761-bd1e2fc095a5';

class CoinData{
  Future<dynamic> getCryptoExRate(String selectedQuoteCurrency) async {
    Map<String, String> cryptoPrices = {};
    Uri url;
    double price;
    for(String crypto in cryptoList){
      url = Uri.parse('$openExRateURL/$crypto/$selectedQuoteCurrency?apikey=$APIKey');
      var networkHelper = NetworkHelper(url: url);
      var data = await networkHelper.getExRateData();
      price = data['rate'];
      cryptoPrices[crypto] = price.toStringAsFixed(0);
    }
    return cryptoPrices;
  }
}