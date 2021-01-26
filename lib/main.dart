import 'package:flutter/material.dart';
import 'package:manu/models/Meal.dart';
import 'package:manu/screens/Categories_screen.dart';
import 'package:manu/screens/Filtering_screen.dart';
import 'package:manu/screens/MealScreen.dart';
import 'package:manu/screens/MealsPage.dart';
import 'package:manu/screens/TabScreen.dart';
import 'package:manu/screens/catgoriesMeals_screen.dart';

void main() {

  runApp(Home());
}


class Home extends StatefulWidget {
  List<Meal> _favoriteMeal =[];
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  toggleFavorite(Meal meal){
    final isExist = widget._favoriteMeal.indexWhere((element) => element.id == meal.id);
    if(isExist >= 0)
      setState(() {
        widget._favoriteMeal.removeAt(isExist);
      });
    else
      setState(() {
        widget._favoriteMeal.add(meal);
      });
    print('done');

  }
  
  bool checkIfFavorite(Meal meal){
    return widget._favoriteMeal.contains(meal);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 245, 229, 1),
        fontFamily: 'Quicksand-Bold',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'Quicksand-Bold',
          ),
        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (ctx) => TobScreen(favoriteMeal: widget._favoriteMeal),
        CategoriesScreen.path: (ctx) => CategoriesScreen(),
        CategoriesMeals_screen.name: (ctx) => CategoriesMeals_screen(),
        MealScreen.path: (ctx) => MealScreen(toggleFavorite: toggleFavorite,checkIfFavorite: checkIfFavorite,),
        List_Meals_Screen.path: (ctx)=> List_Meals_Screen(),
        FilteringScreen.path: (ctx) => FilteringScreen(),
      },
    );
  }
}
