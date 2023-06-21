part of 'events_bloc.dart';

abstract class EventsState extends Equatable {
  final List<MarvelEventsModel>? marvelEvents;
  final String? message;
  const EventsState({this.marvelEvents, this.message});

  @override
  List<Object?> get props => [];
}

class EventsInitial extends EventsState {}

class MarvelCodeErrorState extends EventsState {
  final String? newMessage;

  const MarvelCodeErrorState({this.newMessage}) : super(message: newMessage);
  @override
  List<Object?> get props => [newMessage];
}

class MarvelEventsState extends EventsState {
  final List<MarvelEventsModel>? newMarvelEvents;

  const MarvelEventsState({this.newMarvelEvents})
      : super(marvelEvents: newMarvelEvents);
  @override
  List<Object?> get props => [newMarvelEvents];
}
