class CountryModel {
 static List<Country> meals = [];


}

class Country {
  String? strArea;

  Country({required this.strArea});

  Country.fromJson(Map<String, dynamic> json) {
    strArea = json['strArea'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strArea'] = strArea;
    return data;
  }
}