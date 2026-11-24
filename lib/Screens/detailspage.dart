import 'package:flutter/material.dart';
import 'package:flutterprojecttest/Models/countrymodel.dart';

class Detailspage extends StatelessWidget {
  CountryModel country;
  Detailspage({required this.country, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Center(
          child: Text(
            country.name,
            style: TextStyle(
              fontSize: 40,
              fontWeight: .bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          height: 450,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: .center,
                  mainAxisSize: .min,
                  children: [
                    Image.network(
                      country.weatherimagelink,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      country.name,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: .bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("weather:" + "" + country.weatherecondition),
                    SizedBox(height: 20),
                    Text("Temperature:" + "" + country.tempreature),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
