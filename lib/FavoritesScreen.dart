import 'package:flutter/material.dart';
import 'package:second_app/Meal.dart';
import 'package:second_app/MealItem.dart';

class FavoritesScreen extends StatelessWidget {
  final  List<Meal> favoriteMEals;

  FavoritesScreen(this.favoriteMEals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMEals.isEmpty){
      return Center(child: Text('You have no favorites yet - Start adding some!',
        style: TextStyle(
          color: Colors.pinkAccent,
          fontWeight: FontWeight.w900,
          fontSize: 30.2,
          fontFamily: 'RobotoCondensed',
          letterSpacing: 3,
        ),),);
    }else{
        return ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favoriteMEals[index].id,
                title: favoriteMEals[index].title,
                affordability: favoriteMEals[index].affordability,
                imageUrl: favoriteMEals[index].imageUrl,
                complexity: favoriteMEals[index].complexity,
                duration: favoriteMEals[index].duration,
              );
            },
            itemCount: favoriteMEals.length);
    }

  }
}
