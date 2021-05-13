import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color bgColor;
  CategoryItem({this.title, this.bgColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
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
    );
  }
}
