import 'package:flutter/material.dart';
import 'package:flutter_meals/screens/categories.dart';
import 'package:flutter_meals/screens/category_meals.dart';
import 'package:flutter_meals/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals ',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
                // bodyText1: TextStyle(
                //   color: Color.fromRGBO(20, 51, 51, 1),
                // ),
                // bodyText2: TextStyle(
                //   color: Color.fromRGBO(20, 51, 51, 1),
                // ),
                headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      debugShowCheckedModeBanner: false,
      home: TabScreen(),
      //initialRoute: '/',
      // routes: {
      //   '/': (context) => CategoriesScreen(),
      //   CategoryMeals.routeName: (context) => CategoryMeals(),
      // },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   if (settings.name=='/abc'){
      //     return ...;
      //   }
      //   if (settings.name =='/xyz'){
      //     return ...;
      //   }
      //   return MaterialPageRoute(builder: (context) {
      //     return CategoriesScreen();
      //   });
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return CategoriesScreen();
        });
      },
    );
  }
}
