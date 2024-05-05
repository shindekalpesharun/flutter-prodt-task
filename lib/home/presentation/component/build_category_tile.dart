// Function to generate ListTile dynamically
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodt_task/home/bloc/news_bloc.dart';
import 'package:prodt_task/home/bloc/news_event.dart';

Widget buildCategoryTile(BuildContext context, String category) {
  return ListTile(
    title: Text(category),
    onTap: () {
      BlocProvider.of<NewsBloc>(context).add(LoadNewsEvent(category));
      Navigator.pop(context);
    },
  );
}
