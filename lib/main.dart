import 'package:flutter/material.dart';
import 'package:flutterprojecttest/Providers/authprovider.dart';
import 'package:flutterprojecttest/Providers/countryprovider.dart';
import 'package:flutterprojecttest/Screens/signupPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Authprovide()),
        ChangeNotifierProvider(create: (context) => Countryprovider()),
      ],
      child: MaterialApp(home: Signuppage(), debugShowCheckedModeBanner: false),
    );
  }
}
