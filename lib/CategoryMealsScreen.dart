import 'package:flutter/material.dart';
//import 'dummy-data.dart';
import 'package:second_app/MealItem.dart';
import 'package:second_app/Meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeNAME = '/category-meals';

  final List <Meal> availbleMeals;

  CategoryMealsScreen(this.availbleMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTITLE;
  late List<Meal> displayedMeals;
  var loadingInitData = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  void removeMEAL(String mealID) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealID);
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (loadingInitData == false) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryID = routeArgs['id'];
      categoryTITLE = routeArgs['title'];
      displayedMeals = widget.availbleMeals.where((meal) {
        return meal.categories.contains(categoryID);
      }).toList();
      loadingInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //final routeArgs = (ModalRoute.of(context) as dynamic).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTITLE as String,
          style: TextStyle(
            letterSpacing: 4,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              affordability: displayedMeals[index].affordability,
              imageUrl: displayedMeals[index].imageUrl,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,

            );
          },
          itemCount: displayedMeals.length),
    );
  }
}
