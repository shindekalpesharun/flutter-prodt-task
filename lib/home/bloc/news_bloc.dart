import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodt_task/home/bloc/news_event.dart';
import 'package:prodt_task/home/bloc/news_state.dart';
import 'package:prodt_task/home/repository/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsLoadingState()) {
    on<LoadNewsEvent>(
      (event, emit) async {
        emit(NewsLoadingState());
        try {
          final newsList = await newsRepository.getNewsList(event.category);
          emit(NewsLoadedState(newsList));
        } catch (e) {
          print("Error occured : $e");
          emit(NewsErrorState(e.toString()));
        }
      },
    );
  }
}
