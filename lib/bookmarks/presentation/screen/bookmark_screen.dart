import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodt_task/bookmarks/bloc/bookmark_bloc.dart';
import 'package:prodt_task/bookmarks/bloc/bookmark_event.dart';
import 'package:prodt_task/core/presentation/wrapper/snake_bar_healper.dart';
import 'package:prodt_task/home/model/response/news_list_response.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BookmarkBloc>(context).add(FetchBookmarksEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmarks"),
      ),
      body: BlocBuilder<BookmarkBloc, BookmarkState>(
        builder: (context, state) {
          if (state is BookmarkErrorState) {
            return Center(
              child: Text('No bookmarks'),
            );
          } else if (state is BookmarkLoadedState) {
            List<Datum> bookmarks = state.bookmarks;
            return ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final bookmark = bookmarks[index];
                return ListTile(
                  title: Text(bookmark.title),
                  subtitle: Text(bookmark.date),
                  trailing: IconButton(
                    onPressed: () {
                      BlocProvider.of<BookmarkBloc>(context)
                          .add(RemoveBookmarkEvent(bookmark.id));
                      SnackbarHelper.showSnackbar(
                        context: context,
                        message: 'News removed from bookmark',
                      );
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  onTap: () {},
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
