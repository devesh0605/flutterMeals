import 'package:flutter/material.dart';
import 'package:flutter_meals/models/meal.dart';
import 'package:flutter_meals/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    final mealDetails = Provider.of<MealItem>(context, listen: false);
    _glutenFree = mealDetails.filters['gluten'];
    _lactoseFree = mealDetails.filters['lactose'];
    _vegetarian = mealDetails.filters['vegetarian'];
    _vegan = mealDetails.filters['vegan'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mealDetails = Provider.of<MealItem>(context, listen: false);
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
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              setState(() {
                mealDetails.setFilters(selectedFilters);
              });
            },
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
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _switchBuilder(
                  title: 'Lactose Free',
                  currentState: _lactoseFree,
                  updateValue: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                    _lactoseFree = newValue;
                  },
                ),
                _switchBuilder(
                  title: 'Vegan',
                  currentState: _vegan,
                  updateValue: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                    _vegan = newValue;
                  },
                ),
                _switchBuilder(
                  title: 'Vegetarian',
                  currentState: _vegetarian,
                  updateValue: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
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
