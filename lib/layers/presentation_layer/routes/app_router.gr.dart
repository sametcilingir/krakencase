// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AnimeListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AnimeListPage(),
      );
    },
    AnimeDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AnimeDetailRouteArgs>(
          orElse: () =>
              AnimeDetailRouteArgs(animeId: pathParams.getInt('animeId')));
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AnimeDetailPage(
          key: args.key,
          animeId: args.animeId,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/anime',
          fullMatch: true,
        ),
        RouteConfig(
          AnimeListRoute.name,
          path: '/anime',
        ),
        RouteConfig(
          AnimeDetailRoute.name,
          path: '/anime_detail/:animeId',
        ),
      ];
}

/// generated route for
/// [AnimeListPage]
class AnimeListRoute extends PageRouteInfo<void> {
  const AnimeListRoute()
      : super(
          AnimeListRoute.name,
          path: '/anime',
        );

  static const String name = 'AnimeListRoute';
}

/// generated route for
/// [AnimeDetailPage]
class AnimeDetailRoute extends PageRouteInfo<AnimeDetailRouteArgs> {
  AnimeDetailRoute({
    Key? key,
    required int animeId,
  }) : super(
          AnimeDetailRoute.name,
          path: '/anime_detail/:animeId',
          args: AnimeDetailRouteArgs(
            key: key,
            animeId: animeId,
          ),
          rawPathParams: {'animeId': animeId},
        );

  static const String name = 'AnimeDetailRoute';
}

class AnimeDetailRouteArgs {
  const AnimeDetailRouteArgs({
    this.key,
    required this.animeId,
  });

  final Key? key;

  final int animeId;

  @override
  String toString() {
    return 'AnimeDetailRouteArgs{key: $key, animeId: $animeId}';
  }
}
