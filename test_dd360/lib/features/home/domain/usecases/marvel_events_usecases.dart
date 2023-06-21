import 'package:dartz/dartz.dart';
import 'package:test_dd360/core/errors/failure.dart';
import 'package:test_dd360/core/usecases/use_cases.dart';
import 'package:test_dd360/features/home/data/models/marvel_event_model.dart';
import 'package:test_dd360/features/home/data/repositories/marvel_repository.dart';

class MarvelEventsParams {
  final String id;
  MarvelEventsParams({required this.id});
}

class MarvelEventsUseCases
    extends UseCase<List<MarvelEventsModel>, MarvelEventsParams> {
  final MarvelRepository repository;
  MarvelEventsUseCases({required this.repository});

  @override
  Future<Either<Failure, List<MarvelEventsModel>>> call(
      MarvelEventsParams params) async {
    return await repository.getMarvelEvents(params.id);
  }
}
