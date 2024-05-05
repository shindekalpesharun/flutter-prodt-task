import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodt_task/authentication/bloc/authenticator_bloc.dart';
import 'package:prodt_task/authentication/repository/user_repository.dart';
import 'package:prodt_task/bookmarks/bloc/bookmark_bloc.dart';
import 'package:prodt_task/core/bloc/connectivity_bloc/ConnectivityBloc.dart';
import 'package:prodt_task/core/remote/local/database_helper.dart';
import 'package:prodt_task/core/routes/router.dart';
import 'package:prodt_task/home/bloc/news_bloc.dart';
import 'package:prodt_task/home/repository/news_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => NewsRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ConnectivityBloc(),
          ),
          BlocProvider(
            create: (context) => AuthenticatorBloc(
              RepositoryProvider.of<UserRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => NewsBloc(
              RepositoryProvider.of<NewsRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => BookmarkBloc(DatabaseHelper()),
          ),
        ],
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
