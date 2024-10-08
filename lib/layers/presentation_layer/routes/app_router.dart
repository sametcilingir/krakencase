import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_list/view/anime_list_page.dart';
import '../pages/anime_detail/view/anime_detail_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: AnimeListPage,
      initial: true,
    ),
    AutoRoute(
      page: AnimeDetailPage,
      path: '/anime_detail/:animeId',
    )
  ],
)
class AppRouter extends _$AppRouter {}
