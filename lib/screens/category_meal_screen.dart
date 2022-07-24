import 'package:flutter/material.dart';
import 'package:recipeapp/dummy_data.dart';
import 'package:recipeapp/widgets/meal_item.dart';

import '../modals/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  // final String id;
   String? categoryTitle;
  late List<Meal> displayedMeal;

  var _loaded = false;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(!_loaded){
      final routeArg = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArg['title'];
      final categoryId = routeArg['id'];
      displayedMeal = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loaded = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeal.removeWhere((element) => element.id == mealId);
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
          return MealItem(title: displayedMeal[index].title, imageUrl: displayedMeal[index].imageUrl, duration: displayedMeal[index].duration,
            affordability: displayedMeal[index].affordability, complexity: displayedMeal[index].complexity,
            id: displayedMeal[index].id,  removeItem: _removeMeal,);
      }, itemCount: displayedMeal.length ,)
    );
  }
}
