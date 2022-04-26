class Category_Item_Model {
 static List<Category_Item> meals = [];
}

// ignore: camel_case_types
class Category_Item {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Category_Item({strMeal, strMealThumb, idMeal});

  Category_Item.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strMeal'] = strMeal;
    data['strMealThumb'] = strMealThumb;
    data['idMeal'] = idMeal;
    return data;
  }
}