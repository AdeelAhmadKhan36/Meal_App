
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/src/model/catagory_model.dart';
class CategoryGridItems extends StatelessWidget {
  final Categories category;
  final void Function() onSelectCategory;
   CategoryGridItems({super.key,  required this.category, required this.onSelectCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: InkWell(
        onTap:onSelectCategory,
        child: Container(

          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.88),
              category.color.withOpacity(0.9),

            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

          ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            )
            ),
          ),
        ),
      ),
    );
  }
}
