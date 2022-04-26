import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_meal_db/pages/homePage.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:the_meal_db/model/mealModel.dart';

class HomeDetailPage extends StatelessWidget {
  final Meals meal;
  const HomeDetailPage({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
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
                      Expanded(
                          child: meal.strMeal!.text.semiBold.xl3
                              .overflow(TextOverflow.ellipsis)
                              .maxLines(2)
                              .fontFamily(GoogleFonts.dancingScript()
                                  .fontFamily
                                  .toString())
                              .make())
                    ],
                  ),
                  GFCard(
                    boxFit: BoxFit.cover,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    title: GFListTile(
                      title: Column(
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [],
                          // ).py16(),
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Ingredients"
                                  .text
                                  .semiBold
                                  .xl3
                                  .fontFamily(GoogleFonts.novaSquare()
                                      .fontFamily
                                      .toString())
                                  .make()
                                  .py32(),
                            ],
                          ).py16(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Instructions"
                                  .text
                                  .semiBold
                                  .xl3
                                  .fontFamily(GoogleFonts.novaSquare()
                                      .fontFamily
                                      .toString())
                                  .make()
                                  .py32(),
                              meal.strInstructions!.text.semiBold.xl3
                                  .fontFamily(GoogleFonts.novaSquare()
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

// SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     child: GFCard(
//                       boxFit: BoxFit.cover,
//                       // padding: Vx.m64,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25)),
//                       content: ClipRRect(
//                           borderRadius: BorderRadius.circular(25),
//                           child: CachedNetworkImage(
//                               imageUrl: meal.strMealThumb.toString())),
//                     ).p64(),
//                   )
