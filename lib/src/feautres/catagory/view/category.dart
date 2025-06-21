import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/src/data/dummy_data.dart';
import 'package:meal_app/src/feautres/catagory/widgets/category_grid_item.dart';

import '../../../model/catagory_model.dart';
import '../../../model/meal.dart';
import '../../meal/view/mealpage.dart';
class Categorypage extends StatefulWidget {
  final void Function(Meal meal) onToggleFavourite;
  final Map<String, bool> filters;

  const Categorypage({
    super.key,
    required this.onToggleFavourite,
    required this.filters,
  });

  @override
  State<Categorypage> createState() => _CategorypageState();
}

class _CategorypageState extends State<Categorypage> {

  // Category selection with filtering applied
  void _selectCategory(Categories category) {
    final filteredMeals = dummyMeals.where((meal) {
      if (!meal.categories.contains(category.id)) return false;

      if (widget.filters['gluten']! && !meal.isGlutenFree) return false;
      if (widget.filters['lactose']! && !meal.isLactoseFree) return false;
      if (widget.filters['vegan']! && !meal.isVegan) return false;
      if (widget.filters['vegetarian']! && !meal.isVegetarian) return false;

      return true;
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Mealpage(
          title: category.title,
          meal: filteredMeals,
          onToggleFavourite: widget.onToggleFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          children: [
            for (final category in availableCategories)
              CategoryGridItems(
                category: category,
                onSelectCategory: () => _selectCategory(category),
              ),
          ],
        ),
      ),
    );
  }
}
