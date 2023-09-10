import 'package:firebase_core/firebase_core.dart';
import 'package:fleddit/src/app.dart';
import 'package:fleddit/src/config/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureApp();
  runApp(const ProviderScope(child: FleditApp()));
}

Future<void> _configureApp() async {
  await dotenv.load(fileName: 'dotenv');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
}
