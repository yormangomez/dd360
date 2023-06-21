import 'package:test_dd360/flavor.dart';

class Server {
  // Only change this parameter in case you need to change
  // the environment.
  static bool isTrueEnv = false;
  static String dynamicLink = Flavor.instance.dynamicLink;
  static final String _api = Flavor.instance.api;

  // Endpoints (PENDING TO REFACTOR NOT USE)

  static const String _characters = '/characters';

  static const String _comics = '/comics';
  static const String _events = '/events';
  static const String _series = '/series';
  static const String _stories = '/stories';

  static const String _refreshToken = 'users/rest-auth/token/refresh/';

  // Refactoring !! Important to follow the correct path (USE THIS)

  // Full url (PENDING TO REFACTOR NOT USE)

  static String get character => "$_api$_characters";

  //static String store(int idStore) => "$_api$_storeStores$idStore/";
  static String get refreshToken => "$_api$_refreshToken";

  static String characters(String publicKey, String hash, String timeStamp) =>
      "$_api$_characters?apikey=$publicKey&hash=$hash&ts=$timeStamp";

  static String comics(
          String id, String publicKey, String hash, String timeStamp) =>
      "$_api$_characters/$id$_comics?apikey=$publicKey&hash=$hash&ts=$timeStamp";

  static String events(
          String id, String publicKey, String hash, String timeStamp) =>
      "$_api$_characters/$id$_events?apikey=$publicKey&hash=$hash&ts=$timeStamp";

  static String series(
          String id, String publicKey, String hash, String timeStamp) =>
      "$_api$_characters/$id$_series?apikey=$publicKey&hash=$hash&ts=$timeStamp";

  static String stories(
          String id, String publicKey, String hash, String timeStamp) =>
      "$_api$_characters/$id$_stories?apikey=$publicKey&hash=$hash&ts=$timeStamp";
}
