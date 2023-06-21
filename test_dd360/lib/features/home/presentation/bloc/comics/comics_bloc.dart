import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_dd360/features/home/data/models/marvel_comics_model.dart';
import 'package:test_dd360/features/home/domain/usecases/marvel_comics_usecases.dart';

part 'comics_event.dart';
part 'comics_state.dart';

class ComicsBloc extends Bloc<ComicsEvent, ComicsState> {
  final MarvelComicsUseCases marvelUseCases;

  ComicsBloc({required this.marvelUseCases}) : super(ComicsInitial()) {
    on<ComicsEvent>((event, emit) {});

    on<ComicsGetEvent>((event, emit) async {
      final resultDb =
          await marvelUseCases.repository.getMarvelComics(event.id);

      resultDb.fold((dynamic failure) {
        String message = failure.message;
        emit(MarvelCodeErrorState(newMessage: message));
      }, (List<MarvelComicsModel> marvelComics) {
        emit(MarvelComicsState(newMarvelComics: marvelComics));
      });
    });
  }
}
