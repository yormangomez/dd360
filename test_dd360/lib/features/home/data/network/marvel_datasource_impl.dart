import 'package:test_dd360/core/errors/exceptions.dart';
import 'package:test_dd360/core/helper/utils_helper.dart';
import 'package:test_dd360/core/services/center_api.dart';
import 'package:test_dd360/core/util/server.dart';
import 'package:test_dd360/features/home/data/datasources/marvel_datasource.dart';
import 'package:test_dd360/features/home/data/models/marvel_characte_model.dart';
import 'package:test_dd360/features/home/data/models/marvel_comics_model.dart';
import 'package:test_dd360/features/home/data/models/marvel_event_model.dart';
import 'package:test_dd360/features/home/data/models/marvel_series_model.dart';
import 'package:test_dd360/features/home/data/models/marvel_stories_model.dart';

class MarvelDataSourceImpl extends MarvelDataSource {
  final CenterApi centerApi;

  MarvelDataSourceImpl({required this.centerApi});

  @override
  Future<List<MarvelCharacteModel>> getMarvel() async {
    try {
      String publicKey = 'fea4ddbf370376865724c2b03db5ffef';
      String privateKey = 'dcca949708ec8a3a3b97cf51cacf65cd98a314c4';
      String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      String hash =
          AppUtils.instance.generateHash(timeStamp, privateKey, publicKey);

      final response = await centerApi.get(
          urlSpecific: Server.characters(publicKey, hash, timeStamp));
      if (response.statusCode == 200) {
        final data = (response.result['data']['results'] as List)
            .map((e) => MarvelCharacteModel.fromJson(e))
            .toList();
        return data;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  @override
  Future<List<MarvelComicsModel>> getMarvelComics(String id) async {
    try {
      String publicKey = 'fea4ddbf370376865724c2b03db5ffef';
      String privateKey = 'dcca949708ec8a3a3b97cf51cacf65cd98a314c4';
      String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      String hash =
          AppUtils.instance.generateHash(timeStamp, privateKey, publicKey);
      final response = await centerApi.get(
          urlSpecific: Server.comics(id, publicKey, hash, timeStamp));
      if (response.statusCode == 200) {
        final data = (response.result['data']['results'] as List)
            .map((e) => MarvelComicsModel.fromJson(e))
            .toList();
        return data;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  @override
  Future<List<MarvelEventsModel>> getMarvelEvents(String id) async {
    try {
      String publicKey = 'fea4ddbf370376865724c2b03db5ffef';
      String privateKey = 'dcca949708ec8a3a3b97cf51cacf65cd98a314c4';
      String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      String hash =
          AppUtils.instance.generateHash(timeStamp, privateKey, publicKey);

      final response = await centerApi.get(
          urlSpecific: Server.events(id, publicKey, hash, timeStamp));
      if (response.statusCode == 200) {
        final data = (response.result['data']['results'] as List)
            .map((e) => MarvelEventsModel.fromJson(e))
            .toList();
        return data;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  @override
  Future<List<MarvelSeriesModel>> getMarvelSeries(String id) async {
    try {
      String publicKey = 'fea4ddbf370376865724c2b03db5ffef';
      String privateKey = 'dcca949708ec8a3a3b97cf51cacf65cd98a314c4';
      String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      String hash =
          AppUtils.instance.generateHash(timeStamp, privateKey, publicKey);

      final response = await centerApi.get(
          urlSpecific: Server.series(id, publicKey, hash, timeStamp));
      if (response.statusCode == 200) {
        final data = (response.result['data']['results'] as List)
            .map((e) => MarvelSeriesModel.fromJson(e))
            .toList();
        return data;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  @override
  Future<List<MarvelStoriesModel>> getMarvelStories(String id) async {
    try {
      String publicKey = 'fea4ddbf370376865724c2b03db5ffef';
      String privateKey = 'dcca949708ec8a3a3b97cf51cacf65cd98a314c4';
      String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      String hash =
          AppUtils.instance.generateHash(timeStamp, privateKey, publicKey);

      final response = await centerApi.get(
          urlSpecific: Server.stories(id, publicKey, hash, timeStamp));
      if (response.statusCode == 200) {
        final data = (response.result['data']['results'] as List)
            .map((e) => MarvelStoriesModel.fromJson(e))
            .toList();
        return data;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
