import 'package:dartz/dartz.dart';
import 'package:test_dd360/core/errors/failure.dart';
import 'package:test_dd360/core/usecases/use_cases.dart';
import 'package:test_dd360/features/home/data/models/marvel_series_model.dart';
import 'package:test_dd360/features/home/data/repositories/marvel_repository.dart';

class MarvelSeriesParams {
  final String id;
  MarvelSeriesParams({required this.id});
}

class MarvelSeriesUseCases
    extends UseCase<List<MarvelSeriesModel>, MarvelSeriesParams> {
  final MarvelRepository repository;
  MarvelSeriesUseCases({required this.repository});

  @override
  Future<Either<Failure, List<MarvelSeriesModel>>> call(
      MarvelSeriesParams params) async {
    return await repository.getMarvelSeries(params.id);
  }
}
