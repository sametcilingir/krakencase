import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../application_layer/constants/app_constants.dart';
import '../pages/anime_detail/view/anime_detail_page.dart';
import '../pages/anime_list/view/anime_list_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: AnimeListPage,
      path: AppConstants.animePagePath,
      initial: true,
    ),
    AutoRoute(
      page: AnimeDetailPage,
      path: AppConstants.animeDetailPath,
    )
  ],
)
class AppRouter extends _$AppRouter {}
