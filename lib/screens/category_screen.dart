import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:store_app/screens/womens_clothes.dart';
import 'package:store_app/screens/mens_clothes.dart';
import 'package:store_app/screens/jewlery.dart';
import 'package:store_app/screens/electornics.dart';

class CategoryScreen extends StatelessWidget {
  static String id = 'CategoryPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Handle category selection here
                if (index == 0) {
                  Navigator.pushNamed(context, WomenPage.id);
                } else if (index == 1) {
                  Navigator.pushNamed(context, MenPage.id);
                } else if (index == 2) {
                  Navigator.pushNamed(context, jeweleryPage.id);
                } else if (index == 3) {
                  Navigator.pushNamed(context, electronicsPage.id);
                }
              },
              child: Card(
                elevation: 4.0,
                color: Colors.grey[300],// Add a shadow to the card
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0), // Add padding inside the card
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 18.0, // Adjust font size
                      fontWeight: FontWeight.bold, // Add bold style
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<String> categories = [
  "Women's Clothing",
  "Men's Clothing",
  "Jewelry",
  "Electronics",
  // Add more category names as needed
];