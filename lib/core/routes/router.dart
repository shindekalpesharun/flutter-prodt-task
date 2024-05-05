import 'package:go_router/go_router.dart';
import 'package:prodt_task/authentication/presentation/screens/authentication_screen.dart';
import 'package:prodt_task/bookmarks/presentation/screen/bookmark_screen.dart';
import 'package:prodt_task/home/presentation/screens/home_screen.dart';

// Define a GoRouter instance to manage navigation in your application
final GoRouter router = GoRouter(
  routes: [
    // Define the root route ("/") for the authentication screen
    GoRoute(
      path: "/", // Root path
      builder: (context, state) =>
          AuthenticationScreen(), // Builder function to build the authentication screen
      routes: [
        // Nested routes for the authentication screen
        GoRoute(
          path: "home", // Nested path for the home screen
          builder: (context, state) =>
              HomeScreen(), // Builder function to build the home screen
          routes: [
            // Nested routes for the home screen
            GoRoute(
              path: "bookmark", // Nested path for the bookmark screen
              builder: (context, state) =>
                  BookmarkScreen(), // Builder function to build the bookmark screen
            ),
          ],
        ),
        // Route for directly accessing the bookmark screen
        GoRoute(
          path: "bookmark", // Path for the bookmark screen
          builder: (context, state) =>
              BookmarkScreen(), // Builder function to build the bookmark screen
        ),
      ],
    ),
  ],
);
