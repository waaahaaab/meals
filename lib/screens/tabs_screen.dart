import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/screens/home_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/costume_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final filtredMeals = ref.watch(filtredMealsProvider);

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
      drawer: const CostumeDrawer(),
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
