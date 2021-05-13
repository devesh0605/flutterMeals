import 'package:flutter/material.dart';
import 'package:flutter_meals/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.imageUrl,
  });

  void selectMeal() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        color: Colors.lightGreenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/buger.gif'),
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                    image: NetworkImage(
                      imageUrl,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
