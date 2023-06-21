import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_dd360/features/home/data/models/marvel_stories_model.dart';
import 'package:test_dd360/features/home/domain/usecases/marvel_stories_usecases.dart';

part 'stories_event.dart';
part 'stories_state.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  final MarvelStoriesUseCases marvelUseCases;

  StoriesBloc({required this.marvelUseCases}) : super(StoriesInitial()) {
    on<StoriesEvent>((event, emit) {});

    on<StoriesGetEvent>((event, emit) async {
      final resultDb =
          await marvelUseCases.repository.getMarvelStories(event.id);
      resultDb.fold((dynamic failure) {
        String message = failure.message;
        emit(MarvelCodeErrorState(newMessage: message));
      }, (List<MarvelStoriesModel> marvelSeries) {
        emit(MarvelStoriesState(newMarvelStories: marvelSeries));
      });
    });
  }
}
