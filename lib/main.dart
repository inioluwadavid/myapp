import 'package:flutter/material.dart';
import 'package:recipeapp/dummy_data.dart';
import 'package:recipeapp/screens/category_meal_screen.dart';
import 'package:recipeapp/screens/category_screen.dart';
import 'package:recipeapp/screens/filter_screen.dart';
import 'package:recipeapp/screens/fovorite.dart';
import 'package:recipeapp/screens/meal_details_screen.dart';
import 'package:recipeapp/screens/tabs_screen.dart';

import 'modals/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String, bool> _filters ={
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];
  void _setFilters(Map<String, bool> filterData){

      setState(() {
        _filters = filterData;



      });
  }

  void _toggleFavorite(String mealId){
    final existingIndex =
    _favoriteMeal.indexWhere((meal) => meal.id == mealId);

    if(existingIndex >= 0 ){
      setState(() {
        _favoriteMeal.removeAt(existingIndex);

      });
    }else{
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }

  }
  bool _isMealFavorite(String id){
    return _favoriteMeal.any((meal) => meal.id == id);
  }

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
        '/':(ctx) => TabScreen(_favoriteMeal ),
        '/categorymeal': (ctx) => CategoryMealScreen(_availableMeals),
        '/meal': (ctx) => MealDetailsScreen(_toggleFavorite, _isMealFavorite),
        '/category': (ctx) => CategoryScreen( ),

        '/filter': (ctx) => Filter_Screen(_setFilters)
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }
}






