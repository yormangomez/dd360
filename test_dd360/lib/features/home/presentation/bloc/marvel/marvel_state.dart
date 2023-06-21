part of 'marvel_bloc.dart';

abstract class MarvelState extends Equatable {
  final String? message;
  List<MarvelCharacteModel>? marvelCharacters;

  MarvelState({this.message, this.marvelCharacters});

  @override
  List<Object?> get props => [message];
}

class MarvelInitial extends MarvelState {}

class MarvelCodeErrorState extends MarvelState {
  final String? newMessage;

  MarvelCodeErrorState({this.newMessage}) : super(message: newMessage);
  @override
  List<Object?> get props => [newMessage];
}

class MarvelCharactersState extends MarvelState {
  List<MarvelCharacteModel>? newMarvelCharacters;

  MarvelCharactersState({this.newMarvelCharacters})
      : super(marvelCharacters: newMarvelCharacters);
  @override
  List<Object?> get props => [newMarvelCharacters];
}
