import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals_app/data/meals_data.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/screens/home_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/costume_drawer.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/models/meal_model.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;
  Map<Filter, bool> selectedFilters = kInitialFilters;

  void _getFilters() async {
    Navigator.pop(context);
    Map<Filter, bool> result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FilterScreen(
                  currentFilters: selectedFilters,
                )));

    setState(() {
      selectedFilters = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<MealModel> filtredMeals = mealsData.where((meal) {
      if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();

    String appBarTitle = 'Pick a category';
    Widget activeScreen = HomeScreen(availableMeals: filtredMeals);

    if (_selectedIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      setState(() {
        appBarTitle = 'Favorites';
        activeScreen =
            MealsScreen(title: 'Fovorites', mealsList: favoriteMeals);
      });
    }

    return Scaffold(
      drawer: CostumeDrawer(
        getFilters: _getFilters,
      ),
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: const TextStyle(color: Colors.black, fontSize: 28),
        ),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(192, 201, 224, 249),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.utensils,
                ),
                label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.solidHeart,
                ),
                label: 'Favorites'),
          ]),
    );
  }
}
