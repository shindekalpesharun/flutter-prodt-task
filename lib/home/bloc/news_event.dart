import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class LoadNewsEvent extends NewsEvent {
  final String category;

  const LoadNewsEvent(this.category);
  @override
  List<Object?> get props => [];
}
