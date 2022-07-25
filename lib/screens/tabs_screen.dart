import 'package:flutter/material.dart';
import 'package:recipeapp/screens/category_screen.dart';
import 'package:recipeapp/screens/fovorite.dart';
import 'package:recipeapp/widgets/main_drawer.dart';

import '../modals/meal.dart';
class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;
  void _seletPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    _pages  =[
      {'page':  CategoryScreen(), 'title': 'Menu Categories' },
      {'page':  FavoriteScreen(widget.favoriteMeals), 'title': 'Your Favourite ' }

    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _seletPage,
       unselectedItemColor: Colors.white,
       selectedItemColor: Colors.amber,
       currentIndex: _selectedPageIndex,

       backgroundColor: Theme.of(context).primaryColor,
        items: [

          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
            label: 'Category'
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favourite'
          ),
        ],
      ),
    );
  }
}
