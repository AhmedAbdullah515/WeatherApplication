class CountryModel {
  final String name;
  final String tempreature;
  final String weatherimagelink;
  final String countryimage;
  final String weatherecondition;

  CountryModel({
    required this.name,
    required this.tempreature,
    required this.weatherimagelink,
    required this.countryimage,
    required this.weatherecondition,
  });
}

class Countries {
  List<CountryModel> countries;
  Countries({required this.countries});
  factory Countries.fromjson(Map<String, dynamic> json) {
    final templist = json["country"]
        .map<CountryModel>(
          (country) => CountryModel(
            name: country["name"],
            tempreature: country["tempreature"],
            weatherimagelink: country["weatherImageUrl"],
            countryimage: country["countryImageUrl"],
            weatherecondition: country["weatherCondition"],
          ),
        )
        .toList();
    return Countries(countries: templist);
  }
}
