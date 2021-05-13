import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category';
  // final String title;
  // final String id;
  // CategoryMeals({this.title = 'Default', this.id = 'Default'});
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    // print(categoryTitle);
    // print(categoryId);
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return null;
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
