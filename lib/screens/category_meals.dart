import 'package:flutter/material.dart';
import 'package:flutter_meals/models/dummy_data.dart';
import 'package:flutter_meals/widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  //static const routeName = '/category';
  final String title;
  final String id;
  CategoryMeals({this.title = 'Default', this.id = 'Default'});
  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = title;
    final categoryId = id;
    // print(categoryTitle);
    // print(categoryId);
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Center(
      child: Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: Scrollbar(
          showTrackOnHover: true,
          isAlwaysShown: true,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
                duration: categoryMeals[index].duration,
                imageUrl: categoryMeals[index].imageUrl,
              );
            },
            itemCount: categoryMeals.length,
          ),
        ),
      ),
    );
  }
}
