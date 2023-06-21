import 'package:dartz/dartz.dart';
import 'package:test_dd360/core/errors/failure.dart';
import 'package:test_dd360/core/usecases/use_cases.dart';
import 'package:test_dd360/features/home/data/models/marvel_stories_model.dart';
import 'package:test_dd360/features/home/data/repositories/marvel_repository.dart';

class MarvelStoriesParams {
  final String id;
  MarvelStoriesParams({required this.id});
}

class MarvelStoriesUseCases
    extends UseCase<List<MarvelStoriesModel>, MarvelStoriesParams> {
  final MarvelRepository repository;
  MarvelStoriesUseCases({required this.repository});

  @override
  Future<Either<Failure, List<MarvelStoriesModel>>> call(
      MarvelStoriesParams params) async {
    return await repository.getMarvelStories(params.id);
  }
}
