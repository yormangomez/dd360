import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_dd360/features/home/data/models/marvel_series_model.dart';
import 'package:test_dd360/features/home/domain/usecases/marvel_series_usecases.dart';

part 'series_event.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final MarvelSeriesUseCases marvelUseCases;

  SeriesBloc({required this.marvelUseCases}) : super(SeriesInitial()) {
    on<SeriesEvent>((event, emit) {});

    on<SeriesGetEvent>((event, emit) async {
      final resultDb =
          await marvelUseCases.repository.getMarvelSeries(event.id);
      resultDb.fold((dynamic failure) {
        String message = failure.message;
        emit(MarvelCodeErrorState(newMessage: message));
      }, (List<MarvelSeriesModel> marvelSeries) {
        emit(MarvelSeriesState(newMarvelSeries: marvelSeries));
      });
    });
  }
}
