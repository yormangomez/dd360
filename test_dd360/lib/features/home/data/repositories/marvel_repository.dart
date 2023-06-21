import 'package:dartz/dartz.dart';
import 'package:test_dd360/core/errors/exceptions.dart';
import 'package:test_dd360/core/errors/failure.dart';
import 'package:test_dd360/features/home/data/datasources/marvel_datasource.dart';
import 'package:test_dd360/features/home/data/models/marvel_characte_model.dart';
import 'package:test_dd360/features/home/data/models/marvel_comics_model.dart';
import 'package:test_dd360/features/home/data/models/marvel_event_model.dart';
import 'package:test_dd360/features/home/data/models/marvel_series_model.dart';
import 'package:test_dd360/features/home/data/models/marvel_stories_model.dart';

abstract class MarvelRepository {
  Future<Either<Failure, List<MarvelCharacteModel>>> getMarvel();
  Future<Either<Failure, List<MarvelComicsModel>>> getMarvelComics(String id);
  Future<Either<Failure, List<MarvelEventsModel>>> getMarvelEvents(String id);
  Future<Either<Failure, List<MarvelSeriesModel>>> getMarvelSeries(String id);
  Future<Either<Failure, List<MarvelStoriesModel>>> getMarvelStories(String id);
}

class MarvelRepositoryImpl extends MarvelRepository {
  final MarvelDataSource marvelSources;

  MarvelRepositoryImpl({required this.marvelSources});

  @override
  Future<Either<Failure, List<MarvelCharacteModel>>> getMarvel() async {
    try {
      final marvel = await marvelSources.getMarvel();

      return Right(marvel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, List<MarvelComicsModel>>> getMarvelComics(
      String id) async {
    try {
      final marvel = await marvelSources.getMarvelComics(id);

      return Right(marvel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, List<MarvelEventsModel>>> getMarvelEvents(
      String id) async {
    try {
      final marvel = await marvelSources.getMarvelEvents(id);

      return Right(marvel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, List<MarvelSeriesModel>>> getMarvelSeries(
      String id) async {
    try {
      final marvel = await marvelSources.getMarvelSeries(id);

      return Right(marvel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, List<MarvelStoriesModel>>> getMarvelStories(
      String id) async {
    try {
      final marvel = await marvelSources.getMarvelStories(id);

      return Right(marvel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
