import 'package:flutter/material.dart';
import 'package:second_app/Meal.dart';

//import 'package:second_app/CategoryMealsScreen.dart';
import 'package:second_app/MealDetailScreen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  MealItem({
    required this.id,
    required this.title,
    required this.affordability,
    required this.imageUrl,
    required this.complexity,
    required this.duration,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
        return 'Hard';

      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Pricey:
        return 'Pricey';

      case Affordability.Luxurious:
        return 'Expensive';

      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeNAME,
      arguments: id,
    )
        .then(
      (result) {
        if (result != null) {
          //removeITEM(result);
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.4,
                      horizontal: 20.2,
                    ),
                    width: 400,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.redAccent,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        //backgroundColor: Colors.purple,
                        fontFamily: 'Raleway',
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule_rounded,
                        color: Colors.purple,
                        size: 23.4,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        '$duration Min',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12.3,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work_history,
                        color: Colors.red,
                        size: 23.4,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        complexityText,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12.3,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Colors.green,
                        size: 23.4,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        affordabilityText,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12.3,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
