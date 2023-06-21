part of 'series_bloc.dart';

abstract class SeriesEvent extends Equatable {
  const SeriesEvent();

  @override
  List<Object?> get props => [];
}

class SeriesGetEvent extends SeriesEvent {
  final String id;
  const SeriesGetEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
