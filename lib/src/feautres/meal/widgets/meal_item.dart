import 'package:flutter/material.dart';
import 'package:meal_app/src/feautres/meal/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../model/meal.dart';
import 'meal_details.dart';


class MealItemScreen extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal)onToggleFavourite;

  const MealItemScreen({super.key, required this.meal, required this.onToggleFavourite});
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }


  void selectMeal(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(

            onToggleFavourite: onToggleFavourite,
            meal: meal),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () => selectMeal(context),

      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            // FadeInImage for meal image
            FadeInImage(
              placeholder:  MemoryImage(kTransparentImage),
              // Make sure this exists
              image:NetworkImage(meal.imageUrl) ,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            // Positioned container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Colors.black54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                      MealTrait(icon: Icons.schedule, label:'${meal.duration} min' ),
                      SizedBox(width: 12,),
                      MealTrait(icon: Icons.work, label:complexityText ),
                      SizedBox(width: 12,),

                      MealTrait(icon: Icons.attach_money, label:  affordabilityText),
                  ],
                ),
              ]),
            )
            )],
        ),
      ),
    );
  }
}
