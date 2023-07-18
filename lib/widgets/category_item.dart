import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.category, required this.onTapCategory});

  final CategoryModel category;
  final void Function() onTapCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blueGrey.withOpacity(0.4),
      borderRadius: BorderRadius.circular(10),
      onTap: onTapCategory,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(category.image),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: const Color.fromARGB(151, 0, 0, 0),
                child: Text(
                  category.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
