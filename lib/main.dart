import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 31, 112, 139)),
        useMaterial3: true,
        fontFamily: GoogleFonts.bebasNeue().fontFamily,
      ),
      home: const TabsScreen(),
    );
  }
}
