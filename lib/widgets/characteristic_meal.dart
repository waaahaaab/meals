import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';

class CharacteristicMeal extends StatelessWidget {
  const CharacteristicMeal({
    super.key,
    required this.characteristicState,
    required this.characteristicName,
  });
  final String characteristicName;
  final bool characteristicState;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: characteristicState,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kTextColor)),
        child: Text(
          characteristicName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
