import 'package:flutter/foundation.dart';

class Authmodel {
  final bool Status;
  final String message;

  Authmodel({required this.Status, required this.message});
  factory Authmodel.fromjson(Map<String, dynamic> json) {
    return Authmodel(Status: json["status"], message: json["message"]);
  }
}
