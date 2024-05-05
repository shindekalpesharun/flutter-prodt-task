import 'package:prodt_task/core/remote/remote/api_services.dart';
import 'package:prodt_task/home/model/response/news_list_response.dart';

class NewsRepository {
  Future<NewsListResponse> getNewsList(String category) async {
    return await ApiServices().fetchNewsList(category);
  }
}
