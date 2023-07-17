import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<MealModel> mealsList;

  const MealsScreen({required this.title, required this.mealsList, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: mealsList.isEmpty
          ? const Center(
              child: Text('uh Oh.... '),
            )
          : ListView.builder(
              // shrinkWrap: true,
              itemCount: mealsList.length,
              itemBuilder: (context, index) => MealItem(meal: mealsList[index]),
            ),
    );
  }
}
