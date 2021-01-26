import 'package:flutter/material.dart';
import 'package:manu/models/Meal.dart';
import 'package:manu/widgets/ListSide.dart';
import 'package:manu/widgets/MealItem.dart';

class List_Meals_Screen extends StatelessWidget {
  static const path = '/mealspage';

  @override
  Widget build(BuildContext context) {
    List<Meal> meals = ModalRoute.of(context).settings.arguments as List<Meal>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Meals"),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: meals[index],
          );
        },
      ),
    );
  }
}
