import 'package:dartz/dartz.dart';
import 'package:test_dd360/core/errors/failure.dart';
import 'package:test_dd360/core/usecases/use_cases.dart';
import 'package:test_dd360/features/home/data/models/marvel_characte_model.dart';
import 'package:test_dd360/features/home/data/repositories/marvel_repository.dart';

class MarvelParams {
  MarvelParams();
}

class MarvelUseCases extends UseCase<List<MarvelCharacteModel>, MarvelParams> {
  final MarvelRepository repository;
  MarvelUseCases({required this.repository});

  @override
  Future<Either<Failure, List<MarvelCharacteModel>>> call(
      MarvelParams params) async {
    return await repository.getMarvel();
  }
}
