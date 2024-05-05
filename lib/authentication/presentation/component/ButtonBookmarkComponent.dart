import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Define a button component for handling bookmarks
class ButtonBookmarkComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display a message indicating no internet connection
          Text('No Internet Connection'),
          SizedBox(
            height: 16,
          ),
          // Button to navigate to the bookmarks screen
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to the "/bookmark" route when button is pressed
              context.go("/bookmark");
            },
            icon: Icon(Icons.bookmark), // Icon for bookmarks
            label: Text("Bookmarks"), // Label for the button
          ),
        ],
      ),
    );
  }
}
