import 'package:flutter/material.dart';
import 'package:flutter_meals/widgets/custom_drawer.dart';

class FiltersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Center(
        child: Text('Favorites'),
      ),
    );
  }
}
