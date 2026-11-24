import 'package:flutter/foundation.dart';
import 'package:flutterprojecttest/Models/authmodel.dart';
import 'package:flutterprojecttest/Services/authservice.dart';

class Authprovide extends ChangeNotifier {
  Authmodel? auth;
  Future<bool> userlogin({
    required String password,
    required String email,
  }) async {
    final response = await Authservice.login(password: password, email: email);
    auth = response;
    return response.Status;
  }

  Future<bool> userregister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    final response = await Authservice.register(
      name: name,
      email: email,
      passwordd: password,
      phone: phone,
    );
    auth = response;
    return response.Status;
  }
}
