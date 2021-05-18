import 'package:flutter/material.dart';
import 'package:flutter_meals/models/dummy_data.dart';
import 'package:flutter_meals/models/meal.dart';
import 'package:flutter_meals/widgets/meal_item.dart' as mi;
import 'package:provider/provider.dart';

class CategoryMeals extends StatefulWidget {
  //static const routeName = '/category';
  final String title;
  final String id;
  CategoryMeals({this.title, this.id});

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;
  List<Meal> displayedMeals;

  //final mealDetails = Provider.of<MealItem>(context);

  @override
  void initState() {
    final mealDetails = Provider.of<MealItem>(context, listen: false);
    // TODO: implement initState
    categoryTitle = widget.title;
    final categoryId = widget.id;
    // print(categoryTitle);
    // print(categoryId);
    displayedMeals = mealDetails.availableMeals.where((meal) {
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
              return mi.MealItem(
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
