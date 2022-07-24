import 'package:flutter/material.dart';
import 'package:recipeapp/widgets/main_drawer.dart';
class Filter_Screen extends StatelessWidget {
  const Filter_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Meal'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text(
          'Filter'
        ),
      ),
    );
  }
}
