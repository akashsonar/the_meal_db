import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_meal_db/model/catagoryModel.dart';
import 'package:the_meal_db/model/categoryItemModel.dart';
import 'package:the_meal_db/model/countryModel.dart';
import 'package:the_meal_db/model/mealModel.dart';
import 'package:the_meal_db/widgets/homeWidgets/drawerWidget/categoryItem.dart';
import 'package:velocity_x/velocity_x.dart';

class Customdrawer extends StatefulWidget {
  const Customdrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<Customdrawer> createState() => _CustomdrawerState();
}

class _CustomdrawerState extends State<Customdrawer> {
  static String name = "";
  @override
  void initState() {
    super.initState();
    loadData1();
    loadData2();
    name = name;
    loadData3();
  }

  loadData1() async {
    // await Future.delayed(const Duration(seconds: 1));
    final response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/list.php?c=list"));
    final decodeData = jsonDecode(response.body);
    final productsData = decodeData["meals"];
    CategoryModel.meals =
        List.from(productsData).map((e) => Category.fromJson(e)).toList();
  }

  loadData2() async {
    // await Future.delayed(const Duration(seconds: 1));
    final response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/list.php?a=list"));
    final decodeData = jsonDecode(response.body);
    final productsData = decodeData["meals"];
    CountryModel.meals =
        List.from(productsData).map((e) => Country.fromJson(e)).toList();
    setState(() {});
  }

  loadData3() async {
    await Future.delayed(const Duration(seconds: 3));
    final response = await http.get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=" + name));
    final decodeData = jsonDecode(response.body);
    final productsData = decodeData["meals"];
    Category_Item_Model.meals =
        List.from(productsData).map((e) => Category_Item.fromJson(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme =
        Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return ClipRRect(
      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(210)),
      child: Drawer(
        child: ListView(children: [
          SizedBox(
              height: 180.0,
              child: UserAccountsDrawerHeader(
                  margin: Vx.m0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary),
                  currentAccountPicture: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.lime,
                    child: CircleAvatar(
                      child: CachedNetworkImage(
                          imageUrl: "https://i.ibb.co/GkznS6k/plant.png",
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.running_with_errors_outlined)),
                      // backgroundImage:
                      //     NetworkImage("https://i.ibb.co/GkznS6k/plant.png"),
                      radius: 35,
                    ),
                  ),
                  accountName: "Akash Sonar".text.make(),
                  accountEmail: 'sonarakash888@gmail.com'.text.make())),
          Expanded(
            child: Column(children: [
              Theme(
                data: theme,
                child: ExpansionTile(
                  title: "category".text.make(),
                  children: [
                    ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: CategoryModel.meals.count(),
                      itemBuilder: (BuildContext context, int index) {
                        final category = CategoryModel.meals[index];
                        return ListTile(
                          onTap: () {
                            name = category.strCategory.toString();
                            setState(() {
                              loadData3();
                            });
                            print(category.strCategory.toString());
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return
                                  CategoryItem();

                              //     Scaffold(
                              //   appBar: AppBar(
                              //     leading:
                              //         Builder(builder: (BuildContext context) {
                              //       return IconButton(
                              //           onPressed: () {
                              //             Scaffold.of(context).openDrawer();
                              //           },
                              //           icon: const Icon(CupertinoIcons
                              //               .list_bullet_below_rectangle));
                              //     }),
                              //   ),
                              //   body: ListView.builder(
                              //     itemCount: Category_Item_Model.meals.count(),
                              //     itemBuilder:
                              //         (BuildContext context, int index) {
                              //       final categoryItem =
                              //           Category_Item_Model.meals[index];
                              //       return ListTile(
                              //         leading: categoryItem.strMeal
                              //             .toString()
                              //             .text
                              //             .make(),
                              //       );
                              //     },
                              //   ),
                              // );
                            }));
                          },
                          leading: category.strCategory.toString().text.make(),
                        );
                      },
                    )
                  ],
                ),
              ),
              Theme(
                  data: theme,
                  child: ExpansionTile(
                    title: "Country".text.make(),
                    children: [
                      ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: CountryModel.meals.count(),
                        itemBuilder: (BuildContext context, int index) {
                          final country = CountryModel.meals[index];
                          return ListTile(
                            leading: country.strArea.toString().text.make(),
                          );
                        },
                      ),
                    ],
                  ))
            ]),
          ).p8()
        ]).backgroundColor(Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
