import 'package:crypto/servise/currensy_model.dart';
import 'package:dio/dio.dart';

List<String> cbPrice = [];
List<String> title = [];

class GetCurrencyService {
  static CurrensyModel? respData;

  static Future<List<CurrensyModel>?> getCurrency() async {
    try {
      Response response =
          await Dio().get("https://nbu.uz/uz/exchange-rates/json/");
      if (response.statusCode == 200) {
        var respData=(response.data as List)
            .map((e) => CurrensyModel.fromJson(e))
            .toList();
        return (response.data as List)
            .map((e) => CurrensyModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      throw e;
    }
  }
}
