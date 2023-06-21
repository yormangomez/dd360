part of 'comics_bloc.dart';

abstract class ComicsState extends Equatable {
  final String? message;
  final List<MarvelComicsModel>? marvelComics;

  const ComicsState({this.message, this.marvelComics});

  @override
  List<Object?> get props => [];
}

class ComicsInitial extends ComicsState {}

class MarvelCodeErrorState extends ComicsState {
  final String? newMessage;

  const MarvelCodeErrorState({this.newMessage}) : super(message: newMessage);
  @override
  List<Object?> get props => [newMessage];
}

class MarvelComicsState extends ComicsState {
  final List<MarvelComicsModel>? newMarvelComics;

  const MarvelComicsState({this.newMarvelComics})
      : super(marvelComics: newMarvelComics);
  @override
  List<Object?> get props => [newMarvelComics];
}
