
class Crypto {
  final String lastPrice;
  Crypto({this.lastPrice});
  factory Crypto.fromBtc(Map<String, dynamic> btc) {
    return Crypto(
      lastPrice: btc['lastPrice'],
    );
  }
}
