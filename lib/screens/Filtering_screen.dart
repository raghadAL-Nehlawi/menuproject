import 'package:flutter/material.dart';
import 'package:manu/models/Meal.dart';
import 'package:manu/screens/MealsPage.dart';
import 'package:manu/widgets/ListSide.dart';
import 'package:manu/data.dart';

class FilteringScreen extends StatefulWidget {
  static const String path = '/filteringpage';
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  Function moveFilteringPage;
  Function moveMealsPage;

  @override
  _FilteringPageState createState() => _FilteringPageState();
}

class _FilteringPageState extends State<FilteringScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('My Filter'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.saved_search,
            ),
            onPressed: (){
              List<Meal> filterMeal= MEALS.where((element) {
                return (element.isGlutenFree == widget._isGlutenFree
                    && element.isLactoseFree == widget._isLactoseFree
                    && element.isVegan == widget._isVegan
                    && element.isVegetarian == widget._isVegetarian);
              }).toList();
              Navigator.of(context).pushNamed(List_Meals_Screen.path,arguments: filterMeal);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          SwitchListTile(
            title: Text(
              'Gluten-free',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text('only include Gluten-free'),
            value: widget._isGlutenFree,
            onChanged: (val) {
              setState(() {
                widget._isGlutenFree = val;
              });
            },
          ),
          SwitchListTile(
            title: Text(
              'Lactose-Free',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text('only include Lactose-Free'),
            value: widget._isLactoseFree,
            onChanged: (val) {
              setState(() {
                widget._isLactoseFree = val;
              });
            },
          ),
          SwitchListTile(
            title: Text(
              'Vegetarian',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text('Vegetarian'),
            value: widget._isVegetarian,
            onChanged: (val) {
              setState(() {
                widget._isVegetarian = val;
              });
            },
          ),
          SwitchListTile(
            title: Text(
              'Vegan',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text('Vegan'),
            value: widget._isVegan,
            onChanged: (val) {
              setState(() {
                widget._isVegan = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
