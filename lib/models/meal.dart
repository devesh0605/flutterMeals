import 'package:flutter/cupertino.dart';
import 'package:flutter_meals/models/dummy_data.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String imageUrl;
  final String title;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.complexity,
    @required this.duration,
    @required this.ingredients,
    @required this.steps,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}

class MealItem with ChangeNotifier {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  Map<String, bool> get filters {
    return {..._filters};
  }

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> get availableMeals {
    return _availableMeals;
  }

  List<Meal> _favoriteMeals = [];

  List<Meal> get favoriteMeals {
    return _favoriteMeals;
  }

  void setFilters(Map<String, bool> filterData) {
    _filters = filterData;
    _availableMeals = DUMMY_MEALS.where((element) {
      if (_filters['gluten'] && !element.isGlutenFree) {
        return false;
      }
      if (_filters['lactose'] && !element.isLactoseFree) {
        return false;
      }
      if (_filters['vegan'] && !element.isVegan) {
        return false;
      }
      if (_filters['vegetarian'] && !element.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners();
  }

  void toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      _favoriteMeals.removeAt(existingIndex);
    } else {
      _favoriteMeals
          .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
    }
    notifyListeners();
  }

  bool isMealFavorite(String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }
}
