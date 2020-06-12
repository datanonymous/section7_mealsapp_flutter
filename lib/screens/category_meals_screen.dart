import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
//  static const routeName = '/category-meals'; //can use CategoryMealsScreen.routeName for pushNamed

  @override
  Widget build(BuildContext context) {
    //extract route arguments
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id']; //like french, asian, etc.
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((element) => element.categories.contains(categoryId)).toList(); //so categoryMeals is a list()
//    final categoryMeals = DUMMY_MEALS.where((x){
//      return x.categories.contains(categoryId);
//    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle + $categoryId'),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index){
          return MealItem(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          );
        },
      ),
    );
  }
}
