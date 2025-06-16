import 'package:flutter/material.dart';
import 'package:meal_app/src/feautres/catagory/view/category.dart';
import 'package:meal_app/src/feautres/meal/view/mealpage.dart';
import 'package:meal_app/src/feautres/meal/widgets/meal_item.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;


  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage= Categorypage();
    var activePageTitle='Categories';
    if(_selectedPageIndex==1){
      activePage= Mealpage(meal: [], );
      activePageTitle="Favorite";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body:activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
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
