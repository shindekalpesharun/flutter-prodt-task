import 'package:prodt_task/home/model/response/news_list_response.dart';

abstract class BookmarkEvent {}

class FetchBookmarksEvent extends BookmarkEvent {}

class AddBookmarkEvent extends BookmarkEvent {
  final Datum datum;

  AddBookmarkEvent(this.datum);
}

class RemoveBookmarkEvent extends BookmarkEvent {
  final String id;

  RemoveBookmarkEvent(this.id);
}

abstract class BookmarkState {}

class BookmarkLoadingState extends BookmarkState {}

class BookmarkLoadedState extends BookmarkState {
  final List<Datum> bookmarks;

  BookmarkLoadedState(this.bookmarks);
}

class BookmarkErrorState extends BookmarkState {
  final String errorMessage;

  BookmarkErrorState(this.errorMessage);
}
