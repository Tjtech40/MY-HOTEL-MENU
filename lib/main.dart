import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class FoodItem {
  final String category;
  final String name;

  FoodItem({required this.category, required this.name});
}

List<FoodItem> breakfastItems = [
  FoodItem(category: 'Breakfast', name: 'Eggs and Bacon'),
  FoodItem(category: 'Breakfast', name: 'Pancakes'),
];

List<FoodItem> lunchItems = [
  FoodItem(category: 'Lunch', name: 'Club Sandwich'),
  FoodItem(category: 'Lunch', name: 'Caesar Salad'),
];

List<FoodItem> snackItems = [
  FoodItem(category: 'Snack', name: 'Fruit Salad'),
  FoodItem(category: 'Snack', name: 'Veggie Sticks'),
];

List<FoodItem> dinnerItems = [
  FoodItem(category: 'Dinner', name: 'Spaghetti Bolognese'),
  FoodItem(category: 'Dinner', name: 'Grilled Chicken'),
];

List<FoodItem> beverageItems = [
  FoodItem(category: 'Beverages', name: 'Coffee'),
  FoodItem(category: 'Beverages', name: 'Tea'),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Menu'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://www.pxfuel.com/en/free-photo-eeedf'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          FoodCategoriesList(),
        ],
      ),
    );
  }
}

class FoodCategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        String category;
        switch (index) {
          case 0:
            category = 'Breakfast';
            break;
          case 1:
            category = 'Lunch';
            break;
          case 2:
            category = 'Snack';
            break;
          case 3:
            category = 'Dinner';
            break;
          case 4:
            category = 'Beverages';
            break;
          default:
            category = '';
        }
        return ListTile(
          title: Text(category),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodItemsScreen(category: category),
              ),
            );
          },
        );
      },
    );
  }
}

class FoodItemsScreen extends StatelessWidget {
  final String category;

  FoodItemsScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    List<FoodItem> items;
    switch (category) {
      case 'Breakfast':
        items = breakfastItems;
        break;
      case 'Lunch':
        items = lunchItems;
        break;
      case 'Snack':
        items = snackItems;
        break;
      case 'Dinner':
        items = dinnerItems;
        break;
      case 'Beverages':
        items = beverageItems;
        break;
      default:
        items = [];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: Text(item.name),
            );
          },
        ),
      ),
    );
  }
}
