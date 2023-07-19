import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/screens/meals_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.availableMeals});

  final List<MealModel> availableMeals;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
        decoration: const BoxDecoration(gradient: kGradient),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(_animationController),
            child: child,
          ),
          child: GridView(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                childAspectRatio: 3 / 2,
                mainAxisExtent: 140,
                mainAxisSpacing: 4,
              ),
              children: [
                for (final category in mealCategories)
                  CategoryItem(
                    category: category,
                    onTapCategory: () {
                      final filteredMeals = widget.availableMeals
                          .where(
                              (meal) => meal.categories.contains(category.id))
                          .toList();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MealsScreen(
                                    title: category.title,
                                    mealsList: filteredMeals,
                                  )));
                    },
                  )
              ]),
        ),
      ),
    );
  }
}
