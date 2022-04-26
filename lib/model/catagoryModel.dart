// ignore: file_names
class CategoryModel {
 static List<Category> meals = [];
}

class Category {
  String? strCategory;

  Category({strCategory});

  Category.fromJson(Map<String, dynamic> json) {
    strCategory = json['strCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strCategory'] = strCategory;
    return data;
  }
}
