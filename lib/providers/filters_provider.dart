import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/meals_data.dart';

enum Filter {
  glutenFree,
  vegan,
  vegetarian,
  lactoseFree,
}

class ActiveFilterNotifier extends StateNotifier<Map<Filter, bool>> {
  ActiveFilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
          Filter.lactoseFree: false,
        });
  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }
}

final activeFilterProvider =
    StateNotifierProvider<ActiveFilterNotifier, Map<Filter, bool>>(
        (ref) => ActiveFilterNotifier());

final filtredMealsProvider = Provider((ref) {
  final selectedFilters = ref.watch(activeFilterProvider);

  return mealsData.where((meal) {
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
});
