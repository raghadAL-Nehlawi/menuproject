import 'package:flutter/material.dart';
import 'package:manu/widgets/CategoryItem.dart';

import '../data.dart';

class CategoriesScreen extends StatelessWidget {
  static const path = '/CategoriesScreen';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(5),
      children: [
        ...categories
            .map((category) => CategoryItem(
                  title: category.title,
                  id: category.id,
                  color: category.color,
                ))
            .toList()
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
    );
  }
}
