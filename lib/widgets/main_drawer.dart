import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _buildList(String title, IconData icon, VoidCallback tapHandler){
    return  ListTile(
      leading: Icon(icon, size: 20.0,),
      title: Text(title,
        style: TextStyle(
          fontSize: 15,

        ),
      ),
      onTap: tapHandler,


    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 120,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Colors.amber,
                child: Text('Hungry?',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Roboto',
                    fontSize: 30,
                    color: Theme.of(context).primaryColor
                  ),
                ),
              ),
              SizedBox(height: 20,),
              _buildList('Resturant', Icons.restaurant, (){
                Navigator.of(context).pushReplacementNamed('/');
              }),
              _buildList('Settings', Icons.settings, (){
                Navigator.of(context).pushReplacementNamed('/filter');
              })
            ],
          ),
    );
  }
}

