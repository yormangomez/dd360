import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_dd360/features/home/data/models/marvel_event_model.dart';
import 'package:test_dd360/features/home/domain/usecases/marvel_events_usecases.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final MarvelEventsUseCases marvelUseCases;

  EventsBloc({required this.marvelUseCases}) : super(EventsInitial()) {
    on<EventsEvent>((event, emit) {});

    on<EventsGetEvent>((event, emit) async {
      final resultDb =
          await marvelUseCases.repository.getMarvelEvents(event.id);
      resultDb.fold((dynamic failure) {
        String message = failure.message;
        emit(MarvelCodeErrorState(newMessage: message));
      }, (List<MarvelEventsModel> marvelEvents) {
        emit(MarvelEventsState(newMarvelEvents: marvelEvents));
      });
    });
  }
}
