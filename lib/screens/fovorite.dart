import 'package:flutter/material.dart';

import '../modals/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('No Favorite Screen yet!'),
      );
    }else{
      return ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(title: favoriteMeals[index].title, imageUrl: favoriteMeals[index].imageUrl, duration: favoriteMeals[index].duration,
          affordability: favoriteMeals[index].affordability, complexity: favoriteMeals[index].complexity,
          id: favoriteMeals[index].id,  );
      }, itemCount: favoriteMeals.length ,);
    }

  }
}
