import 'package:flutter/material.dart';
import 'package:meal_app/src/model/meal.dart';

class Mealpage extends StatelessWidget {

  final String title;
  final List<Meal>meal;
  const Mealpage({super.key, required this.title, required this.meal});

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
            return Text(meal[index].title);
          });

    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
      body: content,

    );
  }
}
