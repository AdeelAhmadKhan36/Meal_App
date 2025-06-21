import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterState {
  final bool glutenFree;
  final bool vegetarian;
  final bool vegan;
  final bool lactoseFree;

  const FilterState({
    this.glutenFree = false,
    this.vegetarian = false,
    this.vegan = false,
    this.lactoseFree = false,
  });

  FilterState copyWith({
    bool? glutenFree,
    bool? vegetarian,
    bool? vegan,
    bool? lactoseFree,
  }) {
    return FilterState(
      glutenFree: glutenFree ?? this.glutenFree,
      vegetarian: vegetarian ?? this.vegetarian,
      vegan: vegan ?? this.vegan,
      lactoseFree: lactoseFree ?? this.lactoseFree,
    );
  }

  Map<String, bool> toMap() {
    return {
      'gluten': glutenFree,
      'vegetarian': vegetarian,
      'vegan': vegan,
      'lactose': lactoseFree,
    };
  }
}

class FilterNotifier extends StateNotifier<FilterState> {
  FilterNotifier() : super(const FilterState());

  void toggleGlutenFree(bool value) => state = state.copyWith(glutenFree: value);
  void toggleVegetarian(bool value) => state = state.copyWith(vegetarian: value);
  void toggleVegan(bool value) => state = state.copyWith(vegan: value);
  void toggleLactoseFree(bool value) => state = state.copyWith(lactoseFree: value);
}

final filterProvider = StateNotifierProvider<FilterNotifier, FilterState>((ref) {
  return FilterNotifier();
});
