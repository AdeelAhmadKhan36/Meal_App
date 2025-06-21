import 'package:flutter/material.dart';
import 'package:meal_app/src/model/meal.dart';
class MealDetailScreen extends StatelessWidget {
  final Meal meal;
    final void Function(Meal meal)onToggleFavourite;

  const MealDetailScreen({super.key, required this.meal, required this.onToggleFavourite});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
         actions: [
           IconButton(onPressed: (){


             onToggleFavourite(meal);

           }, icon: Icon(Icons.star))
         ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text("Ingredient",style:  TextStyle(
              color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18),
              textAlign: TextAlign.center,

            ),
            for(final ingredient in meal.ingredients)
            Text(
               ingredient,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            Text("Steps",style:  TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18),
              textAlign: TextAlign.center,

            ),
            Text(
              meal.steps.toString()
              ,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
