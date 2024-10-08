// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:krakencase/layers/data_layer/services/remote/anime/anime_api_service.dart'
    as _i3;
import 'package:krakencase/layers/data_layer/services/remote/anime/anime_remote_service.dart'
    as _i5;
import 'package:krakencase/layers/data_layer/services/remote/anime/base/anime_remote_service_base.dart'
    as _i4;
import 'package:krakencase/layers/data_layer/services/remote/module/network_module.dart'
    as _i12;
import 'package:krakencase/layers/domain_layer/repositories/anime/anime_repository.dart'
    as _i7;
import 'package:krakencase/layers/domain_layer/repositories/anime/base/anime_repository_base.dart'
    as _i6;
import 'package:krakencase/layers/domain_layer/usecases/get_anime_detail_usecase.dart'
    as _i8;
import 'package:krakencase/layers/domain_layer/usecases/get_top_anime_usecase.dart'
    as _i9;
import 'package:krakencase/layers/presentation_layer/pages/anime_detail/bloc/anime_detail_bloc.dart'
    as _i10;
import 'package:krakencase/layers/presentation_layer/pages/anime_list/bloc/anime_list_bloc.dart'
    as _i11;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i3.AnimeApiService>(() => networkModule.animeApiService);
    gh.lazySingleton<_i4.AnimeRemoteServiceBase>(
        () => _i5.AnimeRemoteService(apiService: gh<_i3.AnimeApiService>()));
    gh.lazySingleton<_i6.AnimeRepositoryBase>(() =>
        _i7.AnimeRepository(remoteService: gh<_i4.AnimeRemoteServiceBase>()));
    gh.lazySingleton<_i8.GetAnimeDetailUseCase>(
        () => _i8.GetAnimeDetailUseCase(gh<_i6.AnimeRepositoryBase>()));
    gh.lazySingleton<_i9.GetTopAnimeUseCase>(
        () => _i9.GetTopAnimeUseCase(gh<_i6.AnimeRepositoryBase>()));
    gh.factory<_i10.AnimeDetailBloc>(
        () => _i10.AnimeDetailBloc(gh<_i8.GetAnimeDetailUseCase>()));
    gh.factory<_i11.AnimeListBloc>(
        () => _i11.AnimeListBloc(gh<_i9.GetTopAnimeUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i12.NetworkModule {}
