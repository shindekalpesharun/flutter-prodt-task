import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prodt_task/bookmarks/bloc/bookmark_bloc.dart';
import 'package:prodt_task/bookmarks/bloc/bookmark_event.dart';
import 'package:prodt_task/core/components/cached_network_image_component.dart';
import 'package:prodt_task/core/presentation/wrapper/snake_bar_healper.dart';
import 'package:prodt_task/home/bloc/news_bloc.dart';
import 'package:prodt_task/home/bloc/news_event.dart';
import 'package:prodt_task/home/bloc/news_state.dart';
import 'package:prodt_task/home/model/response/news_list_response.dart';
import 'package:prodt_task/home/presentation/component/build_drawer_widget.dart';
import 'package:prodt_task/utils/screen_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(LoadNewsEvent("national"));
  }

  @override
  Widget build(BuildContext context) {
    late final PageController _pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ProDt Task'),
        actions: [
          GestureDetector(
            onTap: () {
              context.go("/home/bookmark");
            },
            child: Icon(Icons.bookmark_outline),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      drawer: BuildDrawerWidget(),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsLoadedState) {
            List<Datum> newsList = state.newsList.data;
            return PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  width: ScreenUtils(context).getScreenWidth(),
                  height: ScreenUtils(context).getScreenHeight(),
                  duration: Duration(milliseconds: 300),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CachedNetworkImageComponent(
                            imageUrl: newsList[index].imageUrl,
                            height: ScreenUtils(context).getScreenHeight() / 3,
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newsList[index].title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        '${newsList[index].date.toString()} - ${newsList[index].time}'),
                                    GestureDetector(
                                      onTap: () async {
                                        BlocProvider.of<BookmarkBloc>(context)
                                            .add(AddBookmarkEvent(Datum(
                                                author: newsList[index].author,
                                                content:
                                                    newsList[index].content,
                                                date: newsList[index].date,
                                                id: newsList[index].id,
                                                imageUrl:
                                                    newsList[index].imageUrl,
                                                readMoreUrl:
                                                    newsList[index].readMoreUrl,
                                                time: newsList[index].time,
                                                title: newsList[index].title,
                                                url: newsList[index].url)));
                                        SnackbarHelper.showSnackbar(
                                          context: context,
                                          message: 'News added to bookmark',
                                        );
                                      },
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.5),
                                        child: Icon(
                                          Icons.bookmark_add_outlined,
                                          color:
                                              Colors.black, // Color of the icon
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(newsList[index].content),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (await launchUrl(Uri.parse(newsList[index].url))) {
                            throw Exception(
                                'Could not launch ${newsList[index].url}');
                          }
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(
                                0.5), // Example background color with opacity
                          ),
                          child: Container(
                            width: ScreenUtils(context).getScreenWidth(),
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Read More...',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Text("not getting any");
        },
      ),
    );
  }
}
