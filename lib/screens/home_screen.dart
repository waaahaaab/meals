import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Pick a category',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        decoration: const BoxDecoration(gradient: kGradient),
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
                CategoryItem(category: category)
            ]),
      ),
    );
  }
}
