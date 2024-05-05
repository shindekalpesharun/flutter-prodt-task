import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:prodt_task/home/model/response/news_list_response.dart';

@immutable
abstract class NewsState extends Equatable {}

class NewsLoadingState extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadedState extends NewsState {
  NewsLoadedState(this.newsList);

  final NewsListResponse newsList;

  @override
  List<Object?> get props => [newsList];
}

class NewsErrorState extends NewsState {
  NewsErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
