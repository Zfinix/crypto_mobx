import 'dart:convert';

import 'package:crypto_mobx/models/cryptoModel.dart';
import 'package:http/http.dart' as http;

class Api {
  static final String API_URL = 'https://api.nomics.com/v1';

  static final String API_KEY = 'YOUR_API_KEY';

  static final String GET_CURRENCIES = '$API_URL/currencies/ticker';

  static Future<CryptoModel> getData(context) async {
    try {
      //POST REQUEST BUILD

      final response = await http.get('$GET_CURRENCIES?key=$API_KEY'
          '&ids=BTC,ETH,ETC,MTC,LTC,ICO,ETC,XRP'
          '&interval=1d,30d&convert=USD');
      print(response.body);

      if (response.statusCode == 200) {
        //  saveItem(item: '${response.body}', key: 'message');
        return CryptoModel.fromJson(json.decode('{"data":${response.body}}'));
      } else {
        return null;
      }
    } catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      //if (e.response.body != null) {

      print(e.toString());
    }

    return null;
  }
}
