import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meals_app/constants.dart';

class CostumeDrawer extends StatelessWidget {
  final void Function() getFilters;
  const CostumeDrawer({required this.getFilters, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(gradient: kGradient),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.bowlFood,
                    color: Colors.white,
                    size: 35,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Tasty Picks!',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ],
              )),
          ListTile(
            onTap: () {},
            leading: const Icon(
              FontAwesomeIcons.fishFins,
              size: 24,
            ),
            title: const Text(
              'Meals',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
          ListTile(
            onTap: getFilters,
            leading: const Icon(
              FontAwesomeIcons.filter,
              size: 24,
            ),
            title: const Text(
              'Filters',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
