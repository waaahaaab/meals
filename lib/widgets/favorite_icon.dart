import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/constants.dart';

class FavoriteIcon extends ConsumerWidget {
  const FavoriteIcon({
    super.key,
    required this.meal,
    required this.isDescriptionScreen,
  });
  final bool isDescriptionScreen;
  final MealModel meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFavorite = ref.watch(favoriteMealsProvider).contains(meal);

    return IconButton(
        onPressed: () {
          isFavorite = ref
              .read(favoriteMealsProvider.notifier)
              .toggleFavoriteMealsList(meal);

          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(isFavorite
                ? 'Meal added as favorite'
                : 'Meal is no more favorite'),
            duration: const Duration(seconds: 3),
          ));
        },
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: Tween<double>(begin: 0.5, end: 1).animate(animation),
              child: child,
            );
          },
          child: Icon(
            isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
            color: isDescriptionScreen ? Colors.white : kIconColor,
            size: 22,
            key: ValueKey(isFavorite),
          ),
        ));
  }
}
