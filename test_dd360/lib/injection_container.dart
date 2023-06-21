import 'package:chuck_interceptor/chuck.dart';

import 'package:get_it/get_it.dart';
import 'package:test_dd360/core/bloc/global_bloc.dart';
import 'package:test_dd360/core/services/center_api.dart';
import 'package:test_dd360/features/home/data/datasources/marvel_datasource.dart';
import 'package:test_dd360/features/home/data/network/marvel_datasource_impl.dart';
import 'package:test_dd360/features/home/data/repositories/marvel_repository.dart';
import 'package:test_dd360/features/home/domain/usecases/marvel_comics_usecases.dart';
import 'package:test_dd360/features/home/domain/usecases/marvel_events_usecases.dart';
import 'package:test_dd360/features/home/domain/usecases/marvel_series_usecases.dart';
import 'package:test_dd360/features/home/domain/usecases/marvel_stories_usecases.dart';
import 'package:test_dd360/features/home/domain/usecases/marvel_usecases.dart';
import 'package:test_dd360/features/home/presentation/bloc/comics/comics_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/events/events_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/marvel/marvel_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/series/series_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/stories/stories_bloc.dart';
import 'package:test_dd360/flavor.dart';
import 'package:test_dd360/navigator.dart';

final sl = GetIt.instance;

init() async {
  //=======================
  // Blocs
  //=======================
  sl.registerFactory(() => GlobalBloc());
  sl.registerFactory(() => MarvelBloc(marvelUseCases: sl()));
  sl.registerFactory(() => ComicsBloc(marvelUseCases: sl()));
  sl.registerFactory(() => EventsBloc(marvelUseCases: sl()));
  sl.registerFactory(() => SeriesBloc(marvelUseCases: sl()));
  sl.registerFactory(() => StoriesBloc(marvelUseCases: sl()));

  //=======================
  // Use cases
  //=======================
  sl.registerLazySingleton(() => MarvelUseCases(repository: sl()));
  sl.registerLazySingleton(() => MarvelEventsUseCases(repository: sl()));
  sl.registerLazySingleton(() => MarvelComicsUseCases(repository: sl()));
  sl.registerLazySingleton(() => MarvelSeriesUseCases(repository: sl()));
  sl.registerLazySingleton(() => MarvelStoriesUseCases(repository: sl()));

  //=======================
  // Repositories
  //=======================

  sl.registerLazySingleton<MarvelRepository>(
      () => MarvelRepositoryImpl(marvelSources: sl()));

  //=======================
  // DataSource
  //=======================

  sl.registerLazySingleton<MarvelDataSource>(
      () => MarvelDataSourceImpl(centerApi: sl()));

  //=======================
  // Network
  //=======================

  sl.registerLazySingleton<CenterApi>(() => CenterApi());

  //=======================
  // Services
  //=======================

  if (Flavor.instance.showChuck == true) {
    sl.registerLazySingleton<Chuck>(() => Chuck(
        showNotification: true,
        navigatorKey: AppNavigator.navigatorKey,
        showInspectorOnShake: false));
  }
}
