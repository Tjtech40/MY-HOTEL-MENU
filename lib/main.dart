// Import the material package.
import 'package:flutter/material.dart';

// Define the main function to run the app.
void main() {
  runApp(MyApp());
}

// Define the FoodItem class representing food categories.
class FoodItem {
  final String category;

  // Constructor for FoodItem.
  FoodItem({required this.category});
}

// Define a list of food categories.
List<FoodItem> foodItems = [
  FoodItem(category: 'Breakfast'),
  FoodItem(category: 'Lunch'),
  FoodItem(category: 'Snack'),
  FoodItem(category: 'Dinner'),
  FoodItem(category: 'Beverages'),
];

// Define the MyApp class, which is the root of the application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return MaterialApp widget.
    return MaterialApp(
      // Set app title.
      title: 'Food Menu',
      // Set app theme.
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set home screen.
      home: HomeScreen(),
      // Disable debug banner.
      debugShowCheckedModeBanner: false,
    );
  }
}

// Define the HomeScreen class, which represents the main screen of the app.
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return Scaffold widget.
    return Scaffold(
      // Set app bar.
      appBar: AppBar(
        title: Text('Food Menu'),
      ),
      // Set app body as a stack to overlay background image with food categories list.
      body: Stack(
        children: [
          // Background image.
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://www.pxfuel.com/en/free-photo-eeedf'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Food categories list.
          FoodCategoriesList(),
        ],
      ),
    );
  }
}

// Define the FoodCategoriesList class, which displays the list of food categories.
class FoodCategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return a ListView builder.
    return ListView.builder(
      // Set item count to the length of foodItems list.
      itemCount: foodItems.length,
      // Define item builder function.
      itemBuilder: (context, index) {
        // Get food item at current index.
        final foodItem = foodItems[index];
        // Return a ListTile for each food category.
        return ListTile(
          // Set title text to food category.
          title: Text(foodItem.category),
          // Handle category selection onTap.
          onTap: () {
            // Handle category selection
            // You can navigate to a screen showing food items for the selected category
          },
        );
      },
    );
  }
}
