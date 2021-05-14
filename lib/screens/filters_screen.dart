import 'package:flutter/material.dart';
import 'package:flutter_meals/widgets/custom_drawer.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _switchBuilder({
    String title,
    bool currentState,
    Function updateValue,
  }) {
    return SwitchListTile(
      subtitle: Text('Only include $title meals'),
      value: currentState,
      onChanged: updateValue,
      title: Text('$title'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.black87,
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust you meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _switchBuilder(
                  title: 'Gluten Free',
                  currentState: _glutenFree,
                  updateValue: (newValue) {
                    _glutenFree = newValue;
                  },
                ),
                _switchBuilder(
                  title: 'Lactose Free',
                  currentState: _lactoseFree,
                  updateValue: (newValue) {
                    _lactoseFree = newValue;
                  },
                ),
                _switchBuilder(
                  title: 'Vegan',
                  currentState: _vegan,
                  updateValue: (newValue) {
                    _vegan = newValue;
                  },
                ),
                _switchBuilder(
                  title: 'Vegetarian',
                  currentState: _vegetarian,
                  updateValue: (newValue) {
                    _vegetarian = newValue;
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
