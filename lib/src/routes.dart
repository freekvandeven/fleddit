import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectRoute {
  const ProjectRoute(this.route);

  static const splashScreen = ProjectRoute('/');
  static const loginScreen = ProjectRoute('/login');
  static const registerScreen = ProjectRoute('/register');
  static const homeScreen = ProjectRoute('/home');
  static const subredditScreen = ProjectRoute('/r');
  static const postScreen = ProjectRoute('/post');
  static const createPostScreen = ProjectRoute('/create-post');
  static const createSubredditScreen = ProjectRoute('/create-subreddit');
  static const profileScreen = ProjectRoute('/profile');
  static const settingsScreen = ProjectRoute('/settings');
  static const notificationsScreen = ProjectRoute('/notifications');
  static const messagesScreen = ProjectRoute('/messages');
  static const communitiesScreen = ProjectRoute('/communities');

  final String route;

  @override
  String toString() => route;
}

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: ProjectRoute.splashScreen.route,
    redirect: (context, state) async {
      var hooks = <String, RoutePreload>{};

      if (hooks.containsKey(state.uri.toString())) {
        return await hooks[state.uri.toString()]!(context, ref, state);
      }
      return null;
    },
    routes: [
      GoRoute(
        path: ProjectRoute.splashScreen.route,
        pageBuilder: (context, state) => buildPageWithoutTransition(
          context: context,
          state: state,
          child: const Text('splashScreen'),
        ),
      ),
      GoRoute(
        path: ProjectRoute.loginScreen.route,
        pageBuilder: (context, state) => buildPageWithoutTransition(
          context: context,
          state: state,
          child: const Text('loginScreen'),
        ),
      ),
      GoRoute(
        path: ProjectRoute.registerScreen.route,
        pageBuilder: (context, state) => buildPageWithoutTransition(
          context: context,
          state: state,
          child: const Text('registerScreen'),
        ),
      ),
      GoRoute(
        path: ProjectRoute.homeScreen.route,
        pageBuilder: (context, state) => buildPageWithoutTransition(
          context: context,
          state: state,
          child: const Text('homeScreen'),
        ),
      ),
      GoRoute(
        path: ProjectRoute.subredditScreen.route,
        pageBuilder: (context, state) => buildPageWithoutTransition(
          context: context,
          state: state,
          child: const Text('subredditScreen'),
        ),
        routes: [
          GoRoute(
            path: ProjectRoute.postScreen.route,
            pageBuilder: (context, state) => buildPageWithoutTransition(
              context: context,
              state: state,
              child: const Text('postScreen'),
            ),
          ),
          GoRoute(
            path: ProjectRoute.createPostScreen.route,
            pageBuilder: (context, state) => buildPageWithoutTransition(
              context: context,
              state: state,
              child: const Text('createPostScreen'),
            ),
          ),
        ],
      ),
      GoRoute(
        path: ProjectRoute.createSubredditScreen.route,
        pageBuilder: (context, state) => buildPageWithoutTransition(
          context: context,
          state: state,
          child: const Text('createSubredditScreen'),
        ),
      ),
      GoRoute(
        path: ProjectRoute.profileScreen.route,
        pageBuilder: (context, state) => buildPageWithoutTransition(
          context: context,
          state: state,
          child: const Text('profileScreen'),
        ),
      ),
      GoRoute(
        path: ProjectRoute.settingsScreen.route,
        pageBuilder: (context, state) => buildPageWithoutTransition(
          context: context,
          state: state,
          child: const Text('settingsScreen'),
        ),
      ),
      GoRoute(
        path: ProjectRoute.notificationsScreen.route,
        pageBuilder: (context, state) => buildPageWithoutTransition(
          context: context,
          state: state,
          child: const Text('notificationsScreen'),
        ),
      ),
      GoRoute(
        path: ProjectRoute.messagesScreen.route,
        pageBuilder: (context, state) => buildPageWithoutTransition(
          context: context,
          state: state,
          child: const Text('messagesScreen'),
        ),
      ),
      GoRoute(
        path: ProjectRoute.communitiesScreen.route,
        pageBuilder: (context, state) => buildPageWithoutTransition(
          context: context,
          state: state,
          child: const Text('communitiesScreen'),
        ),
      ),
    ],
  ),
);

typedef RoutePreload = FutureOr<String?> Function(
  BuildContext context,
  ProviderRef ref,
  GoRouterState state,
);

CustomTransitionPage buildPageWithFadeTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) =>
    CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );

CustomTransitionPage buildPageWithoutTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) =>
    CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          child,
    );
