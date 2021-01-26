import 'package:flutter/material.dart';
import 'package:manu/models/Meal.dart';

Widget buildTitle(String text) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Text(
      text,
      style: TextStyle(fontSize: 20),
      // style: Theme.of(context).textTheme.bodyText1,
    ),
  );
}

Widget buildList(Widget child) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    height: 150,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)),
      child: Expanded(
        child: child,
      ),
    ),
  );
}

class MealScreen extends StatelessWidget {
  static const path = '/mealScreen';
  final Function toggleFavorite;
  final Function checkIfFavorite;
  MealScreen({this.toggleFavorite, this.checkIfFavorite});

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments as Meal;
    final bool ok = checkIfFavorite(meal);
    return Scaffold(
      appBar: AppBar(
          title: Text(meal.name),
          backgroundColor: Theme.of(context).primaryColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                meal.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle('Ingredients'),
            buildList(ListView(children: [
              ...meal.ingredients.map((e) {
                return Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey)),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  // margin: EdgeInsets.all(vertical: 10),
                  child: Text(
                    e,
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList()
            ])),
            buildTitle('Steps'),
            buildList(ListView(
              children: [
                ...meal.steps.map((e) {
                  return Column(children: [
                    ListTile(
                      title: Text(
                        e,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                      indent: 30,
                      endIndent: 30,
                    ),
                  ]);
                }).toList(),
              ],
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: ok
            ? Icon(
                Icons.star,
              )
            : Icon(
                Icons.star,
                color: Colors.white,
              ),
        onPressed: () => toggleFavorite(meal),
      ),
    );
  }
}
