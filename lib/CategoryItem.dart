import 'package:flutter/material.dart';
import 'package:second_app/CategoryMealsScreen.dart';
//import 'package:second_app/CategoryMealsScreen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color cOlOr;

  CategoryItem(this.id, this.title, this.cOlOr);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeNAME,arguments: {'id':id, 'title':title}
        //MaterialPageRoute(
        //builder: (just) {
        // return CategoryMealsScreen(id,title);
        //),
        // );
        //}
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Colors.purple,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                cOlOr.withOpacity(0.7),
                cOlOr,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
