import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  final mealId;
  MealDetail({this.mealId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The meal id is $mealId'),
      ),
      body: Center(
        child: Text(mealId),
      ),
    );
  }
}
