// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$CryptoController on CryptoControllerBase, Store {
  final _$cryptoDataAtom = Atom(name: 'CryptoControllerBase.cryptoData');

  @override
  List<CryptoData> get cryptoData {
    _$cryptoDataAtom.reportObserved();
    return super.cryptoData;
  }

  @override
  set cryptoData(List<CryptoData> value) {
    _$cryptoDataAtom.context
        .checkIfStateModificationsAreAllowed(_$cryptoDataAtom);
    super.cryptoData = value;
    _$cryptoDataAtom.reportChanged();
  }

  final _$CryptoControllerBaseActionController =
      ActionController(name: 'CryptoControllerBase');

  @override
  void changeCryptoData(List<CryptoData> value) {
    final _$actionInfo = _$CryptoControllerBaseActionController.startAction();
    try {
      return super.changeCryptoData(value);
    } finally {
      _$CryptoControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
