import 'package:flutter/material.dart';
import 'package:manu/models/Meal.dart';
import 'package:manu/widgets/MealItem.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen({this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: favoriteMeals[index]);
        });
  }
}
