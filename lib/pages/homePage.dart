import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_meal_db/model/mealModel.dart';
import 'package:the_meal_db/widgets/homeWidgets/homeDetailsPage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:getwidget/getwidget.dart';
// import 'dart:ui';
// import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    String url = "http://www.themealdb.com/api/json/v1/1/random.php";
    // await Future.delayed(const Duration(seconds: 1));
    final response = await http.get(Uri.parse(url));
    final decodeData = jsonDecode(response.body);
    final productsData = decodeData["meals"];
    MealModel.meals =
        List.from(productsData).map((e) => Meals.fromJson(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 0,
      //   backgroundColor: Theme.of(context).colorScheme.background,
      //   elevation: 0.0,
      //   bottomOpacity: 0.0,
      // ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: MealModel.meals.count(),
          itemBuilder: (BuildContext context, int index) {
            final meal = MealModel.meals[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context, SizeTransition5(HomeDetailPage(meal: meal)));
              },
              child: Column(
                children: [
                  "Meal Of The Day"
                      .text
                      .xl5
                      .capitalize
                      .semiBold
                      .fontFamily(
                          GoogleFonts.dancingScript().fontFamily.toString())
                      .make()
                      .p20(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: GFCard(
                      boxFit: BoxFit.cover,
                      padding: Vx.m4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      content: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: CachedNetworkImage(
                            imageUrl: meal.strMealThumb.toString(),
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  GFCard(
                    boxFit: BoxFit.cover,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    title: GFListTile(
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: "Name : "
                                    .text
                                    .semiBold
                                    .xl3
                                    .fontFamily(GoogleFonts.dancingScript()
                                        .fontFamily
                                        .toString())
                                    .make(),
                              ),
                              Expanded(
                                  child: meal.strMeal!.text.semiBold.xl3
                                      .overflow(TextOverflow.ellipsis)
                                      .maxLines(1)
                                      .fontFamily(GoogleFonts.dancingScript()
                                          .fontFamily
                                          .toString())
                                      .make())
                            ],
                          ).py16(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Category : "
                                  .text
                                  .semiBold
                                  .xl3
                                  .fontFamily(GoogleFonts.dancingScript()
                                      .fontFamily
                                      .toString())
                                  .make(),
                              meal.strCategory!.text.semiBold.xl3
                                  .fontFamily(GoogleFonts.dancingScript()
                                      .fontFamily
                                      .toString())
                                  .make()
                            ],
                          ).py16(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Country Of Origin : "
                                  .text
                                  .semiBold
                                  .xl3
                                  .fontFamily(GoogleFonts.dancingScript()
                                      .fontFamily
                                      .toString())
                                  .make(),
                              meal.strArea!.text.semiBold.xl3
                                  .fontFamily(GoogleFonts.dancingScript()
                                      .fontFamily
                                      .toString())
                                  .make()
                            ],
                          ).py16(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ).backgroundColor(Theme.of(context).colorScheme.background),
      ),
    );
  }
}

class SizeTransition5 extends PageRouteBuilder {
  final Widget page;

  SizeTransition5(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.centerRight,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}
