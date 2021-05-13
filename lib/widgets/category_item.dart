import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meals/screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color bgColor;
  CategoryItem({this.title, this.bgColor, this.id});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.black,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        // Navigator.push(
        //   context,
        //   CupertinoPageRoute(
        //     builder: (context) {
        //       return CategoryMeals(
        //         title: title,
        //         id: id,
        //       );
        //     },
        //   ),
        // );
        Navigator.pushNamed(context, CategoryMeals.routeName, arguments: {
          'title': title,
          'id': id,
        });
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        //color: bgColor,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              bgColor.withOpacity(0.7),
              bgColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
