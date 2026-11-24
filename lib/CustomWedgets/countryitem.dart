import 'package:flutter/material.dart';
import 'package:flutterprojecttest/Models/countrymodel.dart';
import 'package:flutterprojecttest/Screens/detailspage.dart';

class Countryitem extends StatelessWidget {
  final CountryModel country;
  Countryitem({required this.country, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detailspage(country: country),
            ),
          );
        },
        child: Card(
          elevation: 10,
          child: ListTile(
            leading: Image.network(country.countryimage),
            title: Text(
              country.name,
              style: TextStyle(fontSize: 30, fontWeight: .bold),
            ),
            subtitle: Text(country.tempreature, style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
