// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AnimeApiService extends AnimeApiService {
  _$AnimeApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AnimeApiService;

  @override
  Future<Response<Map<String, dynamic>>> getTopAnime(
    int page, {
    String? type,
    String? filter,
  }) {
    final Uri $url = Uri.parse('/top/anime');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'type': type,
      'filter': filter,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> getAnimeDetail(int id) {
    final Uri $url = Uri.parse('/anime/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> getAnimeCharacters(int id) {
    final Uri $url = Uri.parse('/anime/${id}/characters');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
