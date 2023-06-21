import 'package:dartz/dartz.dart';
import 'package:test_dd360/core/errors/failure.dart';
import 'package:test_dd360/core/usecases/use_cases.dart';
import 'package:test_dd360/features/home/data/models/marvel_comics_model.dart';
import 'package:test_dd360/features/home/data/repositories/marvel_repository.dart';

class MarvelComicsParams {
  final String id;
  MarvelComicsParams({required this.id});
}

class MarvelComicsUseCases
    extends UseCase<List<MarvelComicsModel>, MarvelComicsParams> {
  final MarvelRepository repository;
  MarvelComicsUseCases({required this.repository});

  @override
  Future<Either<Failure, List<MarvelComicsModel>>> call(
      MarvelComicsParams params) async {
    return await repository.getMarvelComics(params.id);
  }
}
