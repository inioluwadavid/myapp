import 'package:flutter/material.dart';
import 'package:recipeapp/screens/category_meal_screen.dart';

class CategoryItems extends StatelessWidget {
 final String id;
 final String title;
 final Color color;

 CategoryItems( this.id ,this.title, this.color);

 void _selectedCategory(BuildContext ctx){
   Navigator.of(ctx).pushNamed(
     '/categorymeal', arguments: {
       'id':id,
        'title': title,
   }
     // MaterialPageRoute(builder: (_){
     //   return CategoryMealScreen(id, title);
     // })
   );
 }
 
  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () => _selectedCategory(context),
          borderRadius: BorderRadius.circular(15),
          splashColor: Colors.blue,
      child: Container(
        padding: EdgeInsets.all(15),
        child:  Text(title,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
        ),
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
