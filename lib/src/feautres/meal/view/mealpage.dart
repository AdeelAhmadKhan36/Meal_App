import 'package:flutter/material.dart';
import 'package:meal_app/src/feautres/meal/widgets/meal_item.dart';
import 'package:meal_app/src/model/meal.dart';

class Mealpage extends StatelessWidget {

  final String? title;
  final List<Meal>meal;
   Mealpage({super.key,  this.title,  required this.meal});

  @override
  Widget build(BuildContext context) {
    Widget content=Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Nothing found here!",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              )
          ),
          SizedBox(height: 10,),
          Text("Try Selecting Different Categories"),
        ],
      ),
    );




    if(meal.isNotEmpty){
      content=ListView.builder(
        itemCount: meal.length,
          itemBuilder: (ctx, index){
            return MealItemScreen(meal: meal[index]);
          });

    }
    if(title==null){
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
      body: content,

    );
  }
}
