import 'package:meals_app/models/meal_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<MealModel>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleFavoriteMealsList(MealModel meal) {
    final alreadyExist = state.contains(meal);

    if (alreadyExist) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<MealModel>>(
        (ref) => FavoriteMealsNotifier());
