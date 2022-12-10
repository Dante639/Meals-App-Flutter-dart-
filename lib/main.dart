import 'package:flutter/material.dart';
import 'package:second_app/CategoryMealsScreen.dart';
import 'dummy-data.dart';
import 'package:second_app/MealDetailScreen.dart';
import 'package:second_app/TabsScreen.dart';
import 'package:second_app/FilterScreen.dart';
import 'package:second_app/Meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availbleMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void settFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availbleMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] == false && meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] == false && meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] == false && meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] == false && meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealID) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealID);
    if (existingIndex>=0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    }else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealID),);
      });
    }
  }
  bool isMealFavorite(String id){
    return favoriteMeals.any((meal) => meal.id==id);
  }

  @override
  @deprecated
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.black,
        canvasColor: Colors.black,
        fontFamily: 'Raleway',
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyMedium: TextStyle(color: Colors.red),
              bodyLarge: TextStyle(color: Colors.purple),
              titleMedium: TextStyle(
                fontSize: 25,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
      ),
      //home: CategoryScreen(),

      routes: {
        '/': (ctx) => TabsScreen(favoriteMeals),
        CategoryMealsScreen.routeNAME: (ctx) =>
            CategoryMealsScreen(availbleMeals),
        MealDetailScreen.routeNAME: (ctx) => MealDetailScreen(toggleFavorite,isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(filters, settFilters),
      },
      onGenerateRoute: (setting) {
        print(setting.arguments);
        //    if(setting.arguments=='/meal-detail')
        //   return MaterialPageRoute(builder: (ctx)=>CategoryMealsScreen(),);
        // },
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
          builder: (ctx) => CategoryMealsScreen(availbleMeals),
        );
      },
    );
  }
}
