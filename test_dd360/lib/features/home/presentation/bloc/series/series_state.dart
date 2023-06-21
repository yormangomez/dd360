part of 'series_bloc.dart';

abstract class SeriesState extends Equatable {
  final List<MarvelSeriesModel>? marvelSeries;
  final String? message;

  const SeriesState({this.marvelSeries, this.message});

  @override
  List<Object?> get props => [];
}

class SeriesInitial extends SeriesState {}

class MarvelCodeErrorState extends SeriesState {
  final String? newMessage;

  const MarvelCodeErrorState({this.newMessage}) : super(message: newMessage);
  @override
  List<Object?> get props => [newMessage];
}

class MarvelSeriesState extends SeriesState {
  final List<MarvelSeriesModel>? newMarvelSeries;

  const MarvelSeriesState({this.newMarvelSeries})
      : super(marvelSeries: newMarvelSeries);
  @override
  List<Object?> get props => [newMarvelSeries];
}
