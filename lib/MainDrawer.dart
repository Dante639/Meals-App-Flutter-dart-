import 'package:flutter/material.dart';
import 'package:second_app/FilterScreen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'This Time Cooking',
              style: TextStyle(
                color: Colors.purpleAccent,
                fontWeight: FontWeight.w900,
                fontSize: 32.2,
                fontFamily: 'Raleway',
                letterSpacing: 3,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.deepPurpleAccent,
              size: 27.4,
            ),
            title: Text(
              'Meals',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.w900,
                fontSize: 30.2,
                fontFamily: 'RobotoCondensed',
                letterSpacing: 3,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.deepPurpleAccent,
              size: 27.4,
            ),
            title: Text(
              'Filters',
              style: TextStyle(
                color: Colors.limeAccent,
                fontWeight: FontWeight.w900,
                fontSize: 30.2,
                fontFamily: 'RobotoCondensed',
                letterSpacing: 3,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FilterScreen.routeName,);
            },
          ),
        ],
      ),
    );
  }
}
