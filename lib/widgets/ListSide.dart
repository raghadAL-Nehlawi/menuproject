import 'package:flutter/material.dart';
import 'package:manu/data.dart';
import 'package:manu/screens/Categories_screen.dart';
import 'package:manu/screens/Filtering_screen.dart';
import 'package:manu/screens/MealScreen.dart';
import 'package:manu/screens/MealsPage.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(

          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              color: Colors.amber,
              child: Text(
                'COOKING UP!',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 30,
                  fontFamily: 'Quicksand-Bold',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildListTile('Categories ', Icons.category, (){
              Navigator.of(context).pushReplacementNamed('/');
            }),
            buildListTile('Meals', Icons.restaurant, () {
              Navigator.of(context).pushReplacementNamed(List_Meals_Screen.path, arguments: MEALS);
            }),
            buildListTile('Filters', Icons.settings, () {
              Navigator.of(context).pushReplacementNamed(FilteringScreen.path);
            }),

          ],
        ),
      ),
    );
  }
}
