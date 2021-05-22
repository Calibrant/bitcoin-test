import 'package:flutter/cupertino.dart';

abstract class CryptoState {}

class CryptoEmptyState extends CryptoState {}

class CryptoLoadingState extends CryptoState {}

class CryptoLoadedState extends CryptoState {
 var loadedCrypto;
  CryptoLoadedState({@required this.loadedCrypto})
      : assert(loadedCrypto != null);
}

class CryptoErrorState extends CryptoState {}
