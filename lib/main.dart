import 'package:flutter/material.dart';
import 'package:recipeapp/screens/category_meal_screen.dart';
import 'package:recipeapp/screens/category_screen.dart';
import 'package:recipeapp/screens/filter_screen.dart';
import 'package:recipeapp/screens/fovorite.dart';
import 'package:recipeapp/screens/meal_details_screen.dart';
import 'package:recipeapp/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 255, 224, 225),
        fontFamily: 'Roboto',

      ),
      // home: CategoryScreen( ),
      routes: {
        '/':(ctx) => TabScreen( ),
        '/categorymeal': (ctx) => CategoryMealScreen(),
        '/meal': (ctx) => MealDetailsScreen(),
        '/category': (ctx) => CategoryScreen( ),
        '/fovorite': (ctx) => FavoriteScreen(),
        '/filter': (ctx) => Filter_Screen()
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }
}






