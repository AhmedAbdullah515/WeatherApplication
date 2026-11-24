import 'package:dio/dio.dart';
import 'package:flutterprojecttest/Models/countrymodel.dart';

class Countryservice {
  static Dio dio = Dio();
  static Future<Countries> fetchcountries() async {
    try {
      Response response = await dio.get(
        "https://iats.runasp.net/api/Country/GetCountries",
      );
      return Countries.fromjson(response.data);
    } on DioException catch (dioerror) {
      throw Exception(dioerror);
    } catch (othererror) {
      throw Exception(othererror.toString());
    }
  }
}
