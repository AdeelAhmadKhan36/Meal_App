import 'package:flutter/material.dart';
import '../../filters.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier) onSelectScreen;

  const MainDrawer({super.key, required this.onSelectScreen});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6D0EB5), Color(0xFF4059F1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: const [
                  Icon(Icons.category, size: 28, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.white54),
            ListTile(
              leading: const Icon(Icons.restaurant, color: Colors.white),
              title: const Text(
                'Meal',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onTap: () {
                Navigator.of(context).pop();
                onSelectScreen('meals');
              },
            ),
            ListTile(
              leading: const Icon(Icons.filter_4_outlined, color: Colors.white),
              title: const Text(
                'Filters',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onTap: () async {
                final result = await Navigator.push<Map<String, bool>>(
                  context,
                  MaterialPageRoute(builder: (ctx) => const FilterScreen()),
                );

                Navigator.of(context).pop(); // close drawer

                if (result != null) {
                  onSelectScreen('filter'); // Notify parent to update filters
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
