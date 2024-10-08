import 'package:krakencase/layers/presentation_layer/pages/anime_detail/bloc/anime_detail_bloc.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_list/bloc/anime_list_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:krakencase/layers/data_layer/services/remote/anime/base/anime_remote_service_base.dart';
import 'package:krakencase/layers/domain_layer/repositories/anime/base/anime_repository_base.dart';

@GenerateMocks([
  AnimeRemoteServiceBase,
  AnimeRepositoryBase,
  AnimeDetailBloc,
  AnimeListBloc
])
void main() {}
