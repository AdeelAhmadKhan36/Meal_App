import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/constants/colors.dart';
import '../providers/filter_provider.dart'; // 👈 import your provider

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool currentValue,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      value: currentValue,
      onChanged: onChanged,
      title: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 10),
          Text(title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 35.0),
        child: Text(subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            )),
      ),
      activeColor: AppColors.accent,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterProvider);
    final notifier = ref.read(filterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Navigator.pop(context, filters.toMap());
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _buildSwitchTile(
            title: 'Gluten-Free',
            subtitle: 'Only include gluten-free meals',
            icon: Icons.no_food,
            currentValue: filters.glutenFree,
            onChanged: notifier.toggleGlutenFree,
          ),
          _buildSwitchTile(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            icon: Icons.eco,
            currentValue: filters.vegetarian,
            onChanged: notifier.toggleVegetarian,
          ),
          _buildSwitchTile(
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            icon: Icons.spa,
            currentValue: filters.vegan,
            onChanged: notifier.toggleVegan,
          ),
          _buildSwitchTile(
            title: 'Lactose-Free',
            subtitle: 'Only include lactose-free meals',
            icon: Icons.local_drink,
            currentValue: filters.lactoseFree,
            onChanged: notifier.toggleLactoseFree,
          ),
        ],
      ),
    );
  }
}
