// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';

enum LocationFormat { es, en }

enum UserType { admin, collaborator, owner }

class AppUtils {
  AppUtils._internal();
  static final AppUtils _instance = AppUtils._internal();
  static AppUtils get instance => _instance;

  String generateHash(String timeStamp, String privateKey, String publicKey) {
    var bytes = utf8.encode(timeStamp + privateKey + publicKey);
    var md5Hash = md5.convert(bytes);
    return md5Hash.toString();
  }

  String generateLocation(LocationFormat locationFormat) {
    switch (locationFormat) {
      case LocationFormat.es:
        return "es";
      case LocationFormat.en:
        return "en";
    }
  }

  /// convert String to String with 2 decimals and currency

  getDataDecode(Uint8List bodyBytes) {
    return json.decode(utf8.decode(bodyBytes));
  }
}
