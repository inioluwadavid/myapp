import 'package:flutter/material.dart';
import 'package:recipeapp/widgets/main_drawer.dart';
class Filter_Screen extends StatefulWidget {

  final Function saveFilters;

  Filter_Screen(this.saveFilters);

  @override
  State<Filter_Screen> createState() => _Filter_ScreenState();
}

class _Filter_ScreenState extends State<Filter_Screen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Meal'),
        actions: [
          IconButton(onPressed: widget.saveFilters(), icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal section.',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Roboto',

                ),
            ),

          ),
          Expanded(child: ListView(
            children: [
              SwitchListTile(title: Text('Gluten-free'), value: _glutenFree,
                  subtitle: Text('Only include gluten-free meals.'), onChanged: (newValue){
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              SwitchListTile(title: Text('Lactose-free'), value: _lactoseFree,
                  subtitle: Text('Only include Lactose-free meals.'), onChanged: (newValue){
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
              SwitchListTile(title: Text('Vegetarian'), value: _vegetarian,
                  subtitle: Text('Only include Vegetarian meals.'), onChanged: (newValue){
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              SwitchListTile(title: Text('Vegan'), value: _vegan,
                  subtitle: Text('Only include Vegan meals.'), onChanged: (newValue){
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
