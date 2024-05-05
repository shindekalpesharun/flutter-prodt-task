import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodt_task/bookmarks/bloc/bookmark_event.dart';
import 'package:prodt_task/core/remote/local/database_helper.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  // final BookmarkRepository bookmarkRepository;
  final DatabaseHelper dbHelper;

  BookmarkBloc(this.dbHelper) : super(BookmarkLoadingState()) {
    on<FetchBookmarksEvent>(
      (event, emit) async {
        emit(BookmarkLoadingState());
        try {
          final bookmarkList = await dbHelper.getBookmarks();
          emit(BookmarkLoadedState(bookmarkList));
        } catch (e) {
          print("Error occurred : $e");
          emit(BookmarkErrorState(e.toString()));
        }
      },
    );

    on<AddBookmarkEvent>(
      (event, emit) async {
        emit(BookmarkLoadingState());
        try {
          await dbHelper.insertDatum(event.datum);
          final bookmarkList = await dbHelper.getBookmarks();
          emit(BookmarkLoadedState(bookmarkList));
        } catch (e) {
          print("Error occurred : $e");
          emit(BookmarkErrorState(e.toString()));
        }
      },
    );

    on<RemoveBookmarkEvent>(
      (event, emit) async {
        emit(BookmarkLoadingState());
        try {
          await dbHelper.removeBookmark(event.id);
          final bookmarkList = await dbHelper.getBookmarks();
          emit(BookmarkLoadedState(bookmarkList));
        } catch (e) {
          print("Error occurred : $e");
          emit(BookmarkErrorState(e.toString()));
        }
      },
    );
  }
}
