import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/src/feautres/catagory/view/category.dart';
import 'package:meal_app/src/feautres/meal/view/mealpage.dart';
import 'package:meal_app/src/model/meal.dart';

import '../../filters.dart';
import '../widget/main_drawer.dart';

class TabScreen extends ConsumerStatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favMeals = [];

  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };

  void _showInfoMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.deepOrange,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _toggleFavoriteScreen(Meal meal) {
    final isExisting = _favMeals.contains(meal);

    setState(() {
      if (isExisting) {
        _favMeals.remove(meal);
        _showInfoMessage(context, 'Removed from favorites');
      } else {
        _favMeals.add(meal);
        _showInfoMessage(context, 'Added to favorites');
      }
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectScreen(String identifier) async {
    if (identifier == 'meals') {
      Navigator.of(context).pop();
    } else if (identifier == 'filter') {
      final selectedFilters = await Navigator.of(context).push<Map<String, bool>>(
        MaterialPageRoute(builder: (ctx) => const FilterScreen()),
      );

      if (selectedFilters != null) {
        setState(() {
          _filters = selectedFilters;
        });
        print('Selected Filters: $_filters'); // 👈 Check this in the console
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage;
    String activePageTitle;

    if (_selectedPageIndex == 0) {
      activePage = Categorypage(
        onToggleFavourite: _toggleFavoriteScreen,
        filters: _filters,
      );
      activePageTitle = 'Categories';
    } else {
      activePage = Mealpage(
        meal: _favMeals,
        onToggleFavourite: _toggleFavoriteScreen,
      );
      activePageTitle = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        centerTitle: true,
        backgroundColor: const Color(0xFF6D0EB5),
      ),
      drawer: MainDrawer(
        onSelectScreen: _selectScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: const Color(0xFF6D0EB5),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
