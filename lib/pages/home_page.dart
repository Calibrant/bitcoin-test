import 'package:flutter/material.dart';
import 'package:flutter_test_task/pages/crypto_page.dart';
import 'package:flutter_test_task/utilities/constants.dart' as Constants;

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto coin app'),
        centerTitle: true,
      ),
      backgroundColor: Constants.Color.black,
      body: CryptoPage(),
    );
  }
}
