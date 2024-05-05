import 'package:flutter/material.dart';

// Helper class for showing snackbar messages
class SnackbarHelper {
  // Method to show a snackbar
  static void showSnackbar({
    required BuildContext context, // Build context for displaying the snackbar
    required String message, // Message to be displayed in the snackbar
    String? actionLabel, // Label for an optional action button
    VoidCallback? onActionPressed, // Callback for the optional action button
    Duration duration = const Duration(
        seconds: 4), // Duration for which the snackbar is visible
  }) {
    // Create a snackbar with the specified parameters
    final snackbar = SnackBar(
      content:
          Text(message), // Set the snackbar content to the provided message
      duration: duration, // Set the duration for which the snackbar is visible
      action: (actionLabel != null && onActionPressed != null)
          ? SnackBarAction(
              label:
                  actionLabel, // Set the label for the action button if provided
              onPressed:
                  onActionPressed, // Set the callback for the action button if provided
            )
          : null, // If no action button is provided, set it to null
    );

    // Show the snackbar using ScaffoldMessenger
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
