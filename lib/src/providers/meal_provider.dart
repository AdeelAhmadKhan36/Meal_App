


import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dummy_data.dart';

final mealPrvoder=Provider((ref){


  return dummyMeals;
});