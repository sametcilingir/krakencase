import 'package:chopper/chopper.dart';
import '../../../../application_layer/constants/app_constants.dart';

part 'anime_api_service.chopper.dart';

@ChopperApi()
abstract class AnimeApiService extends ChopperService {
  static AnimeApiService create([ChopperClient? client]) => _$AnimeApiService(client);

  @Get(path: AppConstants.getTopAnimePath)
  Future<Response<Map<String, dynamic>>> getTopAnime(
    @Query(AppConstants.pageParam) int page, {
    @Query(AppConstants.typeParam) String? type,
    @Query(AppConstants.filterParam) String? filter,
  });

  @Get(path: AppConstants.getAnimeDetailPath)
  Future<Response<Map<String, dynamic>>> getAnimeDetail(
    @Path(AppConstants.idParam) int id,
  );

  @Get(path: AppConstants.getAnimeCharactersPath)
  Future<Response<Map<String, dynamic>>> getAnimeCharacters(
    @Path(AppConstants.idParam) int id,
  );
}
