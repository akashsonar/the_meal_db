import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';
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
              onTap: () async {
                final Uri _url = Uri.parse(meal.strYoutube.toString());
                if (!await launchUrl(_url)) {
                  throw 'Could not launch $_url';
                }
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: GFCard(
                          color: Theme.of(context).colorScheme.onSecondary,
                          boxFit: BoxFit.cover,
                          padding: Vx.m2,
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
                          child: meal.strMeal!.text.bold.xl3
                              .overflow(TextOverflow.ellipsis)
                              .maxLines(3)
                              .fontFamily(
                                  GoogleFonts.poppins().fontFamily.toString())
                              .make()),
                    ],
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
                              "Category : "
                                  .text
                                  .semiBold
                                  .xl2
                                  .fontFamily(GoogleFonts.poppins()
                                      .fontFamily
                                      .toString())
                                  .make(),
                              meal.strCategory!.text.xl2
                                  .fontFamily(GoogleFonts.poppins()
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
                                  .xl2
                                  .fontFamily(GoogleFonts.poppins()
                                      .fontFamily
                                      .toString())
                                  .make(),
                              meal.strArea!.text.xl2
                                  .fontFamily(GoogleFonts.poppins()
                                      .fontFamily
                                      .toString())
                                  .make()
                            ],
                          ).py16(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              "Youtube : "
                                  .text
                                  .semiBold
                                  .xl2
                                  .fontFamily(GoogleFonts.poppins()
                                      .fontFamily
                                      .toString())
                                  .make(),
                              Expanded(
                                  child: InkWell(
                                onTap: () async {
                                  final Uri _url =
                                      Uri.parse(meal.strYoutube.toString());
                                  if (!await launchUrl(_url)) {
                                    throw 'Could not launch $_url';
                                  }
                                },
                                child: meal.strYoutube!
                                    .toString()
                                    .text
                                    .maxLines(3)
                                    .lg
                                    .align(TextAlign.end)
                                    .fontFamily(GoogleFonts.poppins()
                                        .fontFamily
                                        .toString())
                                    .make(),
                              ))
                            ],
                          ).py16(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Ingredients"
                                  .text
                                  .bold
                                  .xl5
                                  .fontFamily(GoogleFonts.dancingScript()
                                      .fontFamily
                                      .toString())
                                  .make()
                                  .py64(),
                              GridView.count(
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                children: [
                                  meal.strIngredient1
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient2
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient3
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient4
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient5
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient6
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient7
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient8
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient9
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient10
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient11
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient12
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient13
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient14
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                  meal.strIngredient15
                                      .toString()
                                      .text
                                      .xl2
                                      .fontFamily(GoogleFonts.poppins()
                                          .fontFamily
                                          .toString())
                                      .make(),
                                ],
                              ),
                              Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  children: [
                                    "Measures"
                                        .text
                                        .bold
                                        .xl5
                                        .fontFamily(GoogleFonts.dancingScript()
                                            .fontFamily
                                            .toString())
                                        .make()
                                        .py64(),
                                    GridView.count(
                                        crossAxisSpacing: 90.0,
                                        mainAxisSpacing: 30.0,
                                        physics: const ScrollPhysics(),
                                        shrinkWrap: true,
                                        crossAxisCount: 3,
                                        children: [
                                          meal.strMeasure1
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure2
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure3
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure4
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure5
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure6
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure7
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure8
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure9
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure10
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure11
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure12
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure13
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure14
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                          meal.strMeasure15
                                              .toString()
                                              .text
                                              .xl2
                                              .fontFamily(GoogleFonts.poppins()
                                                  .fontFamily
                                                  .toString())
                                              .make(),
                                        ]),
                                  ])
                            ],
                          ).py16(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Instructions"
                                  .text
                                  .bold
                                  .xl5
                                  .fontFamily(GoogleFonts.dancingScript()
                                      .fontFamily
                                      .toString())
                                  .make()
                                  .py64(),
                              meal.strInstructions!.text.xl2
                                  .fontFamily(GoogleFonts.poppins()
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
