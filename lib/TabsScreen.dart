import 'package:flutter/material.dart';
import 'CategoryScreen.dart';
import 'package:second_app/FavoritesScreen.dart';
import 'package:second_app/MainDrawer.dart';
import 'package:second_app/Meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> pages;

  @override
  void initState() {
    pages = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites',
      },
    ];
    // TODO: implement initState
    super.initState();
  }

  int selectPAgeINDEX = 0;

  void selectPAge(int index) {
    setState(() {
      selectPAgeINDEX = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pages[selectPAgeINDEX]['title'],
          style: TextStyle(
            color: Colors.yellowAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: pages[selectPAgeINDEX]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPAge,
        backgroundColor: Colors.black45,
        unselectedItemColor: Colors.pinkAccent,
        selectedItemColor: Colors.purple,
        currentIndex: selectPAgeINDEX,
        type: BottomNavigationBarType.shifting,
        //IF GIVES ERROR CHANGE THIS!!!!!!
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black45,
            icon: Icon(
              Icons.category_outlined,
              color: Colors.greenAccent,
              size: 23.4,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black45,
            icon: Icon(
              Icons.star_border_purple500_outlined,
              color: Colors.yellow,
              size: 23.4,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
