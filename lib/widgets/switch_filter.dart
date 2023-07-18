import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';

class SwitchFilter extends StatelessWidget {
  final void Function(bool) onChanged;

  final String title;
  final String subtitle;
  final bool filterValue;

  const SwitchFilter(
      {required this.title,
      required this.subtitle,
      required this.onChanged,
      required this.filterValue,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: filterValue,
      onChanged: onChanged,
      activeColor: kTextColor,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 26),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
