import 'package:chopper/chopper.dart';

part 'anime_api_service.chopper.dart';

@ChopperApi()
abstract class AnimeApiService extends ChopperService {
  static AnimeApiService create([ChopperClient? client]) =>
      _$AnimeApiService(client);

  @Get(path: '/top/anime')
  Future<Response<Map<String, dynamic>>> getTopAnime(
    @Query('page') int page, {
    @Query('type') String? type,
    @Query('filter') String? filter,
  });

  @Get(path: '/anime/{id}')
  Future<Response<Map<String, dynamic>>> getAnimeDetail(@Path('id') int id);

  @Get(path: '/anime/{id}/characters')
  Future<Response<Map<String, dynamic>>> getAnimeCharacters(@Path('id') int id);
}
