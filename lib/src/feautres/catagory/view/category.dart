import 'package:flutter/material.dart';
import 'package:meal_app/src/data/dummy_data.dart';
import 'package:meal_app/src/feautres/catagory/widgets/category_grid_item.dart';

import '../../meal/view/mealpage.dart';
class Categorypage extends StatefulWidget {
  const Categorypage({super.key});

  @override
  State<Categorypage> createState() => _CategorypageState();
}

class _CategorypageState extends State<Categorypage> {

  void _selectCategory(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Mealpage(title: 'Some Categories',meal:dummyMeals,);
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: Text("Pick Your Category",style: TextStyle(
            color: Colors.white
          ),),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            childAspectRatio:3/2,
            crossAxisSpacing:5,
            mainAxisSpacing: 5,


          ),
          children: [
            for(final category in availableCategories)
              CategoryGridItems(category: category,
              onSelectCategory: _selectCategory
                ,
              )
          ],
        ),
      ),
    );
  }
}
