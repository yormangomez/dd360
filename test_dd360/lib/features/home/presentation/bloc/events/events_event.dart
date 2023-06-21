part of 'events_bloc.dart';

abstract class EventsEvent extends Equatable {
  const EventsEvent();

  @override
  List<Object?> get props => [];
}

class EventsGetEvent extends EventsEvent {
  final String id;
  const EventsGetEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
