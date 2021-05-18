import 'package:flutter/material.dart';
import 'package:flutter_meals/models/meal.dart';
import 'package:provider/provider.dart';
import 'package:flutter_meals/widgets/meal_item.dart' as mi;

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    final favoriteDetails = Provider.of<MealItem>(context, listen: false);
    if (favoriteDetails.favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          "You have no favorites yet - start adding some",
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return mi.MealItem(
            id: favoriteDetails.favoriteMeals[index].id,
            title: favoriteDetails.favoriteMeals[index].title,
            affordability: favoriteDetails.favoriteMeals[index].affordability,
            complexity: favoriteDetails.favoriteMeals[index].complexity,
            duration: favoriteDetails.favoriteMeals[index].duration,
            imageUrl: favoriteDetails.favoriteMeals[index].imageUrl,
            removeItem: null,
          );
        },
        itemCount: favoriteDetails.favoriteMeals.length,
      );
    }
  }
}
