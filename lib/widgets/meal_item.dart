import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/meal_recipe_screen.dart';
import 'package:meals_app/widgets/list_tile_meal.dart';

class MealItem extends StatelessWidget {
  final MealModel meal;

  const MealItem({super.key, required this.meal});

  String get getComplexity {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get getAffordability {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealRecipeScreen(meal: meal)));
      },
      splashColor: const Color.fromARGB(18, 0, 0, 0),
      borderRadius: BorderRadius.circular(24),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 130,
              margin:
                  const EdgeInsets.only(left: 3, right: 6, top: 3, bottom: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(meal.imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          meal.title,
                          textAlign: TextAlign.start,

                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis, //...
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            //FontAwesomeIcons.solidHeart,
                            FontAwesomeIcons.heart,
                            color: kIconColor,
                            size: 22,
                          )),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ListTileMeal(icon: Icons.work, label: getComplexity),
                  Row(
                    children: [
                      ListTileMeal(
                          icon: FontAwesomeIcons.coins,
                          label: getAffordability),
                      const SizedBox(width: 10),
                      ListTileMeal(
                          icon: Icons.schedule_rounded,
                          label: '${meal.duration} min'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
