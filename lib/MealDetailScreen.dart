import 'package:flutter/material.dart';
import 'dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeNAME = '/meal-detail'; //Its Easy to Use!!!!!!!!

  final Function toggleFaVOrite;
  final Function isFaVOrite;

  MealDetailScreen(this.toggleFaVOrite, this.isFaVOrite);

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)!.settings.arguments as String;
    final selectMEAL = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectMEAL.title}',
          style: const TextStyle(
            color: Colors.yellowAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Raleway',
            letterSpacing: 5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMEAL.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.1),
              child: const Text(
                'Ingredients',
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontFamily: 'Raleway',
                  letterSpacing: 1,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple,
                  width: 3.4,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 150,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.black54,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 11),
                    child: Text(
                      selectMEAL.ingredients[index],
                      style: const TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                itemCount: selectMEAL.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.1),
              child: const Text(
                'Steps',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontFamily: 'Raleway',
                  letterSpacing: 1,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purpleAccent,
                  width: 3.4,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 150,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '# ${index + 1}',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'Raleway',
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      title: Text(
                        selectMEAL.steps[index],
                        style: const TextStyle(
                          color: Colors.lime,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          fontFamily: 'Raleway',
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectMEAL.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>toggleFaVOrite(mealID),
        child: Icon(
          isFaVOrite(mealID)
              ? Icons.star
              : Icons.star_border_purple500_outlined,
          color: Colors.yellowAccent,
          size: 32.2,
        ),
      ),
    );
  }
}
