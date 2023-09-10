import 'package:fleddit/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // after two seconds, navigate to the home page
    useEffect(
      () {
        Future.delayed(const Duration(seconds: 2), () {
          context.go(ProjectRoute.homeScreen.route);
        });
        return;
      },
      const [],
    );
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
