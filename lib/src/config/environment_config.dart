import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const _errorMessage = 'Unable to fetch dotenv, did you make sure to generate '
    'your build environment config?\nUse the command: '
    'flutter pub run environment_config:generate\n'
    'For more information, look at the readme\n'
    'Using default now...';

class EnvironmentConfig {
  String get firebaseWebApiKey {
    var firebaseKey = dotenv.env['FIREBASE_WEB_API_KEY'];
    if (firebaseKey == null) {
      debugPrint(_errorMessage);
      throw Exception(_errorMessage);
    }
    return firebaseKey;
  }

  String get firebaseIosApiKey {
    var firebaseKey = dotenv.env['FIREBASE_WEB_API_KEY'];
    if (firebaseKey == null) {
      debugPrint(_errorMessage);
      throw Exception(_errorMessage);
    }
    return firebaseKey;
  }

  String get firebaseAndroidApiKey {
    var firebaseKey = dotenv.env['FIREBASE_WEB_API_KEY'];
    if (firebaseKey == null) {
      debugPrint(_errorMessage);
      throw Exception(_errorMessage);
    }
    return firebaseKey;
  }
}
