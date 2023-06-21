part of 'stories_bloc.dart';

abstract class StoriesState extends Equatable {
  final List<MarvelStoriesModel>? marvelStories;
  final String? message;

  const StoriesState({this.marvelStories, this.message});

  @override
  List<Object?> get props => [message, marvelStories];
}

class StoriesInitial extends StoriesState {}

class MarvelCodeErrorState extends StoriesState {
  final String? newMessage;

  const MarvelCodeErrorState({this.newMessage}) : super(message: newMessage);
  @override
  List<Object?> get props => [newMessage];
}

class MarvelStoriesState extends StoriesState {
  final List<MarvelStoriesModel>? newMarvelStories;

  const MarvelStoriesState({this.newMarvelStories})
      : super(marvelStories: newMarvelStories);
  @override
  List<Object?> get props => [newMarvelStories];
}
