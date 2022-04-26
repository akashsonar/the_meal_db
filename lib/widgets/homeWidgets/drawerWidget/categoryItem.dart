import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_meal_db/model/categoryItemModel.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';
import 'package:the_meal_db/widgets/drawer.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  static String name = "";
  static String url =
      "https://www.themealdb.com/api/json/v1/1/filter.php?c=" + name;
  @override
  void initState() {
    super.initState();
    // name = name;
    loadData();
  }

  loadData() async {
    // await Future.delayed(const Duration(seconds: 5));
    final response = await http.get(Uri.parse(url));
    final decodeData = jsonDecode(response.body);
    final productsData = decodeData["meals"];
    Category_Item_Model.meals =
        List.from(productsData).map((e) => Category_Item.fromJson(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        name = "Breakfast";
        loadData();
        setState(() {});
      }),
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(CupertinoIcons.list_bullet_below_rectangle));
        }),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final categoryItem = Category_Item_Model.meals[index];
                return ListTile(
                  leading: categoryItem.strMeal.toString().text.make(),
                  title: url.toString().text.make(),
                  onTap: () {
                    loadData();
                    print("object");
                    setState(() {});
                  },
                );
              },
              itemCount: Category_Item_Model.meals.length,
            ),
          ],
        ),
      ),
    );
  }
}
