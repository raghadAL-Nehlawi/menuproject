import 'package:flutter/material.dart';
import 'package:manu/data.dart';
import 'package:manu/models/Meal.dart';
import 'package:manu/widgets/MealItem.dart';

class CategoriesMeals_screen extends StatelessWidget {
  static const name = '/categoriesMeals';

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    Color color = arg['color'] as Color;
    String title = arg['title'] as String;
    String id = arg['id'] as String;
    final List<Meal> categoriesMeals = MEALS.where((meal) {
      return meal.categoriesID.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: categoriesMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: categoriesMeals[index],
          );
        },
      ),
    );
  }
}
