import 'package:crypto_mobx/models/cryptoModel.dart';
import 'package:mobx/mobx.dart';

part 'homeController.g.dart';

class CryptoController = CryptoControllerBase with _$CryptoController;

abstract class CryptoControllerBase with Store {
  @observable
  List<CryptoData> cryptoData;

  @action
  void changeCryptoData(List<CryptoData> value) => cryptoData = value;

}
