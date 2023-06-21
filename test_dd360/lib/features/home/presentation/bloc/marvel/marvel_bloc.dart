import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_dd360/features/home/data/models/marvel_characte_model.dart';
import 'package:test_dd360/features/home/domain/usecases/marvel_usecases.dart';

part 'marvel_event.dart';
part 'marvel_state.dart';

class MarvelBloc extends Bloc<MarvelEvent, MarvelState> {
  final MarvelUseCases marvelUseCases;
  MarvelBloc({required this.marvelUseCases}) : super(MarvelInitial()) {
    on<MarvelEvent>((event, emit) {});

    on<MarvelGetEvent>((event, emit) async {
      final resultDb = await marvelUseCases.repository.getMarvel();

      resultDb.fold((dynamic failure) {
        String message = failure.message;
        emit(MarvelCodeErrorState(newMessage: message));
      }, (List<MarvelCharacteModel> marvelCharacters) {
        emit(MarvelCharactersState(newMarvelCharacters: marvelCharacters));
      });
    });
  }
}
