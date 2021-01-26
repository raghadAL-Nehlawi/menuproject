import 'package:flutter/material.dart';
import 'package:manu/screens/catgoriesMeals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  CategoryItem({this.title, this.id, this.color});

  void moveToCategoriesMealsScreen(BuildContext ctx) {
    Navigator.pushNamed(ctx, CategoriesMeals_screen.name,
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => moveToCategoriesMealsScreen(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title, style: TextStyle(fontSize: 17)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
