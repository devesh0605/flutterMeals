import 'package:flutter/material.dart';
import 'package:flutter_meals/screens/categories.dart';
import 'package:flutter_meals/screens/favorites.dart';
import 'package:flutter_meals/widgets/custom_drawer.dart';

class BottomTabBar extends StatefulWidget {
  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Categories',
      'pages': CategoriesScreen(),
      'actions': [
        FlatButton(
          onPressed: () {},
          child: Text('CatButton'),
        ),
      ],
    },
    {
      'pages': Favorites(),
      'title': 'Favorites',
      'actions': [
        FlatButton(
          child: Row(
            children: [
              Icon(Icons.category),
              SizedBox(
                width: 5,
              ),
              Text('Categories'),
            ],
          ),
          onPressed: () {},
        ),
      ],
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        actions: _pages[_selectedPageIndex]['actions'],
      ),
      drawer: CustomDrawer(),
      body: _pages[_selectedPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black87,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
