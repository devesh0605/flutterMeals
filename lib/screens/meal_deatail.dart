import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meals/models/dummy_data.dart';
import 'package:flutter_meals/models/meal.dart';
import 'package:flutter_meals/screens/bottom_tab_bar.dart';
import 'package:provider/provider.dart';

class MealDetail extends StatefulWidget {
  final mealId;
  MealDetail({this.mealId});

  @override
  _MealDetailState createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  Widget headingBuilder(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  final ScrollController _controllerOne = ScrollController();

  final ScrollController _controllerTwo = ScrollController();

  @override
  Widget build(BuildContext context) {
    final mealDetails = Provider.of<MealItem>(context, listen: false);
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == widget.mealId);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(widget.mealId);
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        title: Text('${selectedMeal.title}'),
        actions: [
          FlatButton(
            child: Row(
              children: [
                Text(
                  mealDetails.isMealFavorite(widget.mealId)
                      ? 'Remove Favorite'
                      : 'Add Favorite',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(
                  mealDetails.isMealFavorite(widget.mealId)
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.yellow,
                )
              ],
            ),
            onPressed: () {
              setState(() {
                mealDetails.toggleFavorite(widget.mealId);
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) {
                return BottomTabBar();
              }));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            headingBuilder(context, 'Ingredients'),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Scrollbar(
                controller: _controllerOne,
                isAlwaysShown: true,
                showTrackOnHover: true,
                child: ListView.builder(
                  controller: _controllerOne,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          selectedMeal.ingredients[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
            ),
            headingBuilder(context, 'Steps'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Scrollbar(
                controller: _controllerTwo,
                isAlwaysShown: true,
                showTrackOnHover: true,
                child: ListView.builder(
                  controller: _controllerTwo,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(
                          thickness: 5,
                        ),
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ),

            //Text(selectedMeal),
          ],
        ),
      ),
      backgroundColor: Colors.lightGreen[400],
    );
  }
}
