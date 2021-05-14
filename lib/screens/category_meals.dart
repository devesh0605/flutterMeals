import 'package:flutter/material.dart';
import 'package:flutter_meals/models/dummy_data.dart';
import 'package:flutter_meals/models/meal.dart';
import 'package:flutter_meals/widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  //static const routeName = '/category';
  final String title;
  final String id;
  CategoryMeals({this.title = 'Default', this.id = 'Default'});

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void initState() {
    // TODO: implement initState
    categoryTitle = widget.title;
    final categoryId = widget.id;
    // print(categoryTitle);
    // print(categoryId);
    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.initState();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;

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
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                affordability: displayedMeals[index].affordability,
                complexity: displayedMeals[index].complexity,
                duration: displayedMeals[index].duration,
                imageUrl: displayedMeals[index].imageUrl,
                removeItem: _removeMeal,
              );
            },
            itemCount: displayedMeals.length,
          ),
        ),
      ),
    );
  }
}
