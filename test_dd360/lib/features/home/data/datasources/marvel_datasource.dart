import 'package:test_dd360/features/home/data/models/marvel_characte_model.dart';
import 'package:test_dd360/features/home/data/models/marvel_comics_model.dart';
import 'package:test_dd360/features/home/data/models/marvel_event_model.dart';
import 'package:test_dd360/features/home/data/models/marvel_series_model.dart';
import 'package:test_dd360/features/home/data/models/marvel_stories_model.dart';

abstract class MarvelDataSource {
  Future<List<MarvelCharacteModel>> getMarvel();
  Future<List<MarvelComicsModel>> getMarvelComics(String id);
  Future<List<MarvelEventsModel>> getMarvelEvents(String id);
  Future<List<MarvelSeriesModel>> getMarvelSeries(String id);
  Future<List<MarvelStoriesModel>> getMarvelStories(String id);
}
