import 'package:flutter/material.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/screens/tabs_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.cypressgreen.in/blog/wp-content/uploads/2021/03/food.jpg'),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              gradient: kGradientW,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 2, 43, 47),
                  spreadRadius: 40,
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Cooking experience like a chef',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                const Text(
                  'discover more than 13.. food recipes in your hands and cooking it easily!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(221, 178, 175, 175),
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 2, 43, 47),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text(
                    'Let\'s start',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TabsScreen()));
                  },
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
