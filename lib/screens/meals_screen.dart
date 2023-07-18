import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<MealModel> mealsList;

  const MealsScreen({required this.title, required this.mealsList, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 26,
          left: 16,
          right: 16,
        ),
        decoration: const BoxDecoration(
          gradient: kGradient,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'MEALS',
            style: TextStyle(
                color: Colors.white, fontSize: 80, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 10),
              const Icon(
                FontAwesomeIcons.circleChevronDown,
                color: kIconColor,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: mealsList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Uh oh ... nothing here!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Visibility(
                          visible: title != 'Favorites' && mealsList.isEmpty,
                          child: const Text(
                            'Add Some Meals Now!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Visibility(
                          visible: title == 'Favorites',
                          child: const Text(
                            'Try selecting a different category!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: mealsList.length,
                    itemBuilder: (context, index) =>
                        MealItem(meal: mealsList[index]),
                  ),
          )
        ]),
      ),
    );
  }
}
