import 'package:flutter/material.dart';
import 'package:manu/models/Meal.dart';
import 'package:manu/screens/Categories_screen.dart';
import 'package:manu/screens/Favorite_Screen.dart';
import 'package:manu/widgets/ListSide.dart';

import 'Filtering_screen.dart';

class TobScreen extends StatefulWidget {
  final List <Meal> favoriteMeal;
  TobScreen({this.favoriteMeal});



  @override
  _TobScreenState createState() => _TobScreenState();
}

class _TobScreenState extends State<TobScreen> {
  int pageIndex = 0;
  List<Map<String, Object>> pages;

  _selectPage(index) {
    setState(() {
      pageIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(favoriteMeals: widget.favoriteMeal,),
        'title': 'Favorite',
      }
    ];

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(

        title: Text(pages[pageIndex]['title'] as String),
      ),
      body: pages[pageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: pageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
