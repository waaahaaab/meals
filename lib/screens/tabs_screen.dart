import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals_app/screens/home_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedIndex = 0;

  Widget activeScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(192, 201, 224, 249),
          onTap: (index) {
            _selectedIndex = index;
            setState(() {
              activeScreen = _selectedIndex != 0
                  ? const MealsScreen(title: 'Favorites', mealsList: [])
                  : const HomeScreen();
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
