import 'package:dio/dio.dart';
import 'package:flutterprojecttest/Models/authmodel.dart';

class Authservice {
  static Dio dio = Dio();
  static Future<Authmodel> login({
    required String password,
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {'Email': email, 'Password': password},
      );
      return Authmodel.fromjson(response.data);
    } on DioException catch (dioerror) {
      throw Exception(dioerror);
    } catch (othererror) {
      throw Exception(othererror.toString());
    }
  }

 static Future<Authmodel> register({
    required String name,
    required String email,
    required String passwordd,
    required String phone,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          'Name': name,
          'Email': email,
          'Password': passwordd,
          'Phone': phone,
        },
      );
      return Authmodel.fromjson(response.data);
    } on DioException catch (dioerror) {
      throw Exception(dioerror);
    } catch (othererror) {
      throw Exception(othererror.toString());
    }
  }
}
