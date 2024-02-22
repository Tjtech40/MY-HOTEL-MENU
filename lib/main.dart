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
  FoodItem(category: 'Breakfast', name: 'Mahamuri na maharagwe ya nazi'),
  FoodItem(category: 'Breakfast', name: 'halfcakes na rangi'),
  FoodItem(category: 'Breakfast', name: 'ChapatI na Maharagwe'),
   FoodItem(category: 'Breakfast', name: 'ChapatI na mbaazi ya nazi'),
    FoodItem(category: 'Breakfast', name: 'chai na mkate'),
];

List<FoodItem> lunchItems = [
  FoodItem(category: 'Lunch', name: 'Wari na mboga ya majani'),
  FoodItem(category: 'Lunch', name: 'Wari na samaki'),
  FoodItem(category: 'Lunch', name: 'Wari na Nyama'),
  FoodItem(category: 'Lunch', name: 'wali na Nyama'),
  FoodItem(category: 'Lunch', name: 'Wali na samaki wa nazi'),
  FoodItem(category: 'Lunch', name: 'pilau'),
];

List<FoodItem> snackItems = [
  FoodItem(category: 'Snack', name: 'Fruit Salad'),
  FoodItem(category: 'Snack', name: 'Veggie Sticks'),
];

List<FoodItem> dinnerItems = [
   FoodItem(category: 'Diner', name: 'Wari na mboga ya majani'),
  FoodItem(category: 'Diner', name: 'Wari na samaki'),
  FoodItem(category: 'Diner', name: 'Wari na Nyama'),
  FoodItem(category: 'Diner', name: 'wali na Nyama'),
  FoodItem(category: 'Diner', name: 'Wali na samaki wa nazi'),
  FoodItem(category: 'Diner', name: 'pilau'),
];

List<FoodItem> beverageItems = [
  FoodItem(category: 'Beverages', name: 'Kahawa'),
  FoodItem(category: 'Beverages', name: 'Chai Rangi'),
   FoodItem(category: 'Beverages', name: 'Maji ya madafu'),
    FoodItem(category: 'Beverages', name: 'Tea'),
     FoodItem(category: 'Beverages', name: 'Arwa Baridi'),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Olive Cafe Menu',
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
        title: Text('Olive Cafe '),
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
