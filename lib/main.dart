import 'package:flutter/material.dart';
import 'package:project_hope/Screens/treat_Animal.dart';

import 'Screens/complaint_Screen.dart';
import 'Screens/home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hope',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        "/Home": (context) => const HomeScreen(),
        "/ComplaintScreen" : (context) => ComplaintScreen(),
        "/TreatmentScreen" : (context) => TreatingAnimalScreen(),
      },
    );
  }
}
