import 'package:flutter/material.dart';
import 'package:flutter_meals/screens/bottom_tab_bar.dart';
import 'package:flutter_meals/screens/filters_screen.dart';

class CustomDrawer extends StatelessWidget {
  Widget reptile({String title, IconData iconData, Function function}) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.w700),
      ),
      onTap: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'What\'s Cokin?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          reptile(
            title: 'Meals',
            iconData: Icons.restaurant,
            function: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BottomTabBar();
              }));
            },
          ),
          SizedBox(
            height: 20,
          ),
          reptile(
            title: 'Filters',
            iconData: Icons.settings,
            function: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FiltersScreen();
              }));
            },
          ),
        ],
      ),
    );
  }
}
