import 'package:flutter_test_task/models/crypto.dart';
import 'package:flutter_test_task/services/crypto_api.dart';

class CryptoRepository {
  CryptoProvider _cryptoApi = CryptoProvider();

 Future<List<Crypto>> fetchBtcUsd() => _cryptoApi.requestCrypto();
 
}
