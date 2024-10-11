import 'package:krakencase/layers/application_layer/handlers/exception_handler.dart';
import 'package:krakencase/layers/application_layer/handlers/method_channel_handler.dart';
import 'package:krakencase/layers/data_layer/services/remote/anime/anime_api_service.dart';
import 'package:krakencase/layers/data_layer/services/remote/anime/anime_remote_service.dart';
import 'package:krakencase/layers/domain_layer/repositories/anime/anime_repository.dart';
import 'package:krakencase/layers/domain_layer/usecases/get_anime_detail_usecase.dart';
import 'package:krakencase/layers/domain_layer/usecases/get_top_anime_usecase.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_detail/bloc/anime_detail_bloc.dart';
import 'package:krakencase/layers/presentation_layer/pages/anime_list/bloc/anime_list_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:krakencase/layers/data_layer/services/remote/anime/base/anime_remote_service_base.dart';
import 'package:krakencase/layers/domain_layer/repositories/anime/base/anime_repository_base.dart';

@GenerateNiceMocks([
  //Repository
  MockSpec<AnimeRepositoryBase>(),
  MockSpec<AnimeRepository>(),
  //Bloc
  MockSpec<AnimeDetailBloc>(),
  MockSpec<AnimeListBloc>(),
  //UseCase
  MockSpec<GetTopAnimeUseCase>(),
  MockSpec<GetAnimeDetailUseCase>(),
  //Handler
  MockSpec<ExceptionHandler>(),
  MockSpec<MethodChannelHandler>(),
  //Service
  MockSpec<AnimeRemoteServiceBase>(),
  MockSpec<AnimeRemoteService>(),
  MockSpec<AnimeApiService>(),
])
void main() {}
