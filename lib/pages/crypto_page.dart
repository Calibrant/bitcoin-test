import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_task/bloc/crypto_bloc.dart';
import 'package:flutter_test_task/bloc/crypto_bloc2.dart';
import 'package:flutter_test_task/bloc/crypto_event.dart';
import 'package:flutter_test_task/bloc/crypto_state.dart';
import 'package:flutter_test_task/services/crypto_repository.dart';
import 'package:flutter_test_task/utilities/constants.dart' as Constants;

class CryptoPage extends StatelessWidget {
  final cryptoRepository = CryptoRepository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CryptoBloc>(
          create: (context) => CryptoBloc(cryptoRepository: cryptoRepository),
        ),
        BlocProvider<CryptoBloc2>(
          create: (context) => CryptoBloc2(cryptoRepository: cryptoRepository),
        ),
      ],
      child: Center(
        child: Container(
          decoration: Constants.kBoxDecoration,
          height: 200,
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CryptoWidget(),
              CryptoWidget2(),
            ],
          ),
        ),
      ),
    );
  }
}

class CryptoWidget extends StatelessWidget {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CryptoBloc>();

    return BlocBuilder<CryptoBloc, CryptoState>(builder: (context, state) {
      if (state is CryptoLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is CryptoLoadedState) {
        return Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.button,
                onPrimary: Constants.Color.white,
                primary: Constants.Color.blueGrey,
                padding: EdgeInsets.all(10),
              ),
              onPressed: () {
                checked = !checked;
                bloc.add(CryptoLoadEvent());
              },
              child: checked == true
                  ? Text(
                      '${state.loadedCrypto[11].lastPrice}'.substring(0, 9),
                    )
                  : Text(
                      Constants.PRESSME,
                    ),
            ),
          ],
        );
      }

      return null;
    });
  }
}

class CryptoWidget2 extends StatelessWidget {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CryptoBloc2>();

    return BlocBuilder<CryptoBloc2, CryptoState>(builder: (context, state) {
      if (state is CryptoLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is CryptoLoadedState) {
        return Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.button,
                onPrimary: Constants.Color.white,
                primary: Constants.Color.blueGrey,
                padding: EdgeInsets.all(10),
              ),
              onPressed: () {
                checked = !checked;
                bloc.add(CryptoLoadEvent());
              },
              child: checked == true
                  ? Text(
                      '${state.loadedCrypto[11].lastPrice}'.substring(0, 9),
                    )
                  : Text(
                      Constants.PRESSME,
                    ),
            ),
          ],
        );
      }
      return null;
    });
  }
}
