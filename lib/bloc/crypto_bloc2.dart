import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_task/bloc/crypto_event.dart';
import 'package:flutter_test_task/bloc/crypto_state.dart';
import 'package:flutter_test_task/models/crypto.dart';
import 'package:flutter_test_task/services/crypto_repository.dart';

class CryptoBloc2 extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository cryptoRepository;

  CryptoBloc2({this.cryptoRepository})
      : super(CryptoLoadedState(loadedCrypto: cryptoRepository));

  @override
  Stream<CryptoState> mapEventToState(CryptoEvent event) async* {
    if (event is CryptoLoadEvent) {

      try {
        final List<Crypto> cryptoLastPrice = await cryptoRepository.fetchBtcUsd();

        yield CryptoLoadedState(loadedCrypto: cryptoLastPrice);
      } catch (e) {
        yield CryptoErrorState();
      }
    }
  }
}
