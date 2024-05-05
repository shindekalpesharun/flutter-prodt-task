import 'package:dio/dio.dart';
import 'package:prodt_task/core/constants/constants.dart';
import 'package:prodt_task/home/model/response/news_list_response.dart';

// Service class for API requests
class ApiServices {
  final Dio _dio = Dio(); // Dio instance for making HTTP requests

  // Method to fetch news list from the API
  // Default category is set to "national"
  Future<NewsListResponse> fetchNewsList([String category = "national"]) async {
    try {
      // Make a GET request to fetch news data based on the specified category
      final response =
          await _dio.get("${Constants.baseUrl}/news?category=$category");
      print(response.data); // Print the response data for debugging
      // Convert the response data into a NewsListResponse object and return it
      return NewsListResponse.fromJson(response.data);
    } catch (e) {
      print('Error fetching data:$e'); // Print error message if request fails
      throw Exception("Failed to fetch category"); // Throw an exception
    }
  }
}
