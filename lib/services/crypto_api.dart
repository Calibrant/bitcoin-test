import 'dart:convert';
import 'dart:async';
import 'package:flutter_test_task/models/crypto.dart';
import 'package:http/http.dart' as http;

class CryptoProvider {
  static const APIURL = 'https://api.binance.com/api/v3/ticker/24hr#';

  Future<List<Crypto>> requestCrypto() async {
    var responce = await http.get(APIURL);
    if (responce.statusCode == 200) {
      final List<dynamic> cryptoJson = json.decode(responce.body);
      return cryptoJson.map((btc) => Crypto.fromBtc(btc)).toList();
    } else
      Exception('Failed load BTCUSDT');
  }
}
