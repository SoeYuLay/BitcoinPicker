import 'package:bitcoin_ticker/services/network.dart';

const openExRateURL = 'https://rest.coinapi.io/v1/exchangerate';
const APIKey = 'e4e00177-9aec-4d80-a761-bd1e2fc095a5';
class ExchangeRateModel{
  late NetworkHelper networkHelper;
  Future<dynamic> getExchangeRate() async{
    var url = Uri.parse('$openExRateURL/BTC/USD?apikey=$APIKey');
    networkHelper = NetworkHelper(url: url);
    return await networkHelper.getExRateData();
  }

  Future<dynamic> getQuoteExchangeRate(String selectedQuoteCurrency) async {
    var url = Uri.parse('$openExRateURL/BTC/$selectedQuoteCurrency?apikey=$APIKey');
    networkHelper = NetworkHelper(url: url);
    return await networkHelper.getExRateData();
  }
}