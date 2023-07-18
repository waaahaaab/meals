import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/constants.dart';

class FavoriteIcon extends ConsumerStatefulWidget {
  const FavoriteIcon({
    super.key,
    required this.meal,
    required this.isDescriptionScreen,
  });
  final bool isDescriptionScreen;
  final MealModel meal;

  @override
  ConsumerState<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends ConsumerState<FavoriteIcon> {
  bool isFavorite = false;

  @override
  void initState() {
    isFavorite = ref.read(favoriteMealsProvider).contains(widget.meal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = ref
                .read(favoriteMealsProvider.notifier)
                .toggleFavoriteMealsList(widget.meal);
          });

          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(isFavorite
                ? 'Meal added as favorite'
                : 'Meal is no more favorite'),
            duration: const Duration(seconds: 3),
          ));
        },
        icon: Icon(
          isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
          color: widget.isDescriptionScreen! ? Colors.white : kIconColor,
          size: 22,
        ));
  }
}
