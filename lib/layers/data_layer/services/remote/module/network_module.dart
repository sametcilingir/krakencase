import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';

import '../../../../application_layer/constants/app_constants.dart';
import '../anime/anime_api_service.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  AnimeApiService get animeApiService => AnimeApiService.create(
        ChopperClient(
          baseUrl: Uri.parse(AppConstants.baseUrl),
          services: [
            AnimeApiService.create(),
          ],
          converter: const JsonConverter(),
          interceptors: [HttpLoggingInterceptor()],
        ),
      );
}
