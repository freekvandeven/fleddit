import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fleddit/src/routes.dart';
import 'package:fleddit/src/theme/dark_theme.dart';
import 'package:fleddit/src/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FleditApp extends HookConsumerWidget {
  const FleditApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // log an event to firebase analytics
    useEffect(
      () {
        Future.delayed(Duration.zero, () async {
          await FirebaseAnalytics.instance.logAppOpen();
        });
        return;
      },
      const [],
    );

    return MaterialApp.router(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.system,
      routerConfig: ref.watch(routerProvider),
    );
  }
}
