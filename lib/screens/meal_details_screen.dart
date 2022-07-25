import 'package:flutter/material.dart';
import 'package:recipeapp/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailsScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSelectedSection (String text){
    return Container(
      margin: EdgeInsets.symmetric(vertical:15),
      child: Text( text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 25,
            fontFamily: 'Roboto',

        ),
      ),

    );
  }

  Widget buildContentSection( Widget child ){
    return Container(
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.grey)
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    height: 150,
    width: 300,
    child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title:  Text('${selectedMeal.title}'),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),
            ),
            buildSelectedSection('Ingredients'),
            buildContentSection(ListView.builder(itemBuilder: (ctx, index){
              return Card(
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              );
            }, itemCount: selectedMeal.ingredients.length,), ),

            buildSelectedSection('Steps'),
            buildContentSection(ListView.builder(itemBuilder: (ctx, index){
              return Column( children: [
              ListTile(
              leading: CircleAvatar( child: Text('# ${(index + 1)}'),),
              title: Text(selectedMeal.steps[index]),
              ),
                Divider()
              ],);
            }, itemCount: selectedMeal.steps.length ,))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
