import 'package:flutter/material.dart';
import 'package:meals_app/data/meals_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final filteredMeals = mealsData
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return InkWell(
      splashColor: Colors.blueGrey.withOpacity(0.4),
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealsScreen(
                      title: category.title,
                      mealsList: filteredMeals,
                    )));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(category.image),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: const Color.fromARGB(152, 255, 255, 255),
                child: Text(
                  category.title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
