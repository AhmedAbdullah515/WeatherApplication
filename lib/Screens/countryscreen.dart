import 'package:flutter/material.dart';
import 'package:flutterprojecttest/CustomWedgets/countryitem.dart';
import 'package:flutterprojecttest/Providers/countryprovider.dart';
import 'package:provider/provider.dart';

class Countryscreen extends StatelessWidget {
  Countryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        title: Center(
          child: Text(
            "Countries Screen",
            style: TextStyle(
              fontSize: 40,
              fontWeight: .bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Consumer<Countryprovider>(
        builder: (context, value, child) {
          final data = value.datamodel?.countries;
          if (data == null) {
            value.getcountries();
            return CircularProgressIndicator(color: Colors.black);
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Countryitem(country: data[index]);
            },
          );
        },
      ),
    );
  }
}
