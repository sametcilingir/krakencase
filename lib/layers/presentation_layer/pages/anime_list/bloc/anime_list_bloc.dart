import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application_layer/di/locator.dart';
import '../../../../application_layer/handlers/exception_handler.dart';
import '../../../../application_layer/handlers/method_channel_handler.dart';
import '../../../../domain_layer/entities/anime_entity.dart';
import '../../../../domain_layer/usecases/get_top_anime_usecase.dart';
import 'package:injectable/injectable.dart';
import '../../../../application_layer/constants/string_constants.dart';

part 'anime_list_event.dart';
part 'anime_list_state.dart';

@injectable
class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  final GetTopAnimeUseCase getTopAnimeUseCase;

  final Map<String, String> typeOptions = StringConstants.typeOptionsMap;
  final Map<String, String> filterOptions = StringConstants.filterOptionsMap;

  AnimeListBloc(this.getTopAnimeUseCase) : super(const AnimeListInitial()) {
    on<FetchAnimeListEvent>(_onFetchAnimeList);
    on<ChangeFilterEvent>(_onChangeFilter);
    on<CallMethodChannelEvent>(_onCallMethodChannel);
    _handleMethodCalls();
  }

  void _handleMethodCalls() {
    locator<MethodChannelHandler>().setMethodCallHandler(
      (call) async {
        if (call.method == StringConstants.fetchAnimeListMethod) {
          add(
            const FetchAnimeListEvent(
              page: 1,
              reset: true,
            ),
          );
        }
      },
    );
  }

  Future<void> _onCallMethodChannel(
    CallMethodChannelEvent event,
    Emitter<AnimeListState> emit,
  ) async {
    await locator<MethodChannelHandler>().invokeMethod(
      StringConstants.fetchAnimeListMethod,
    );
  }

  Future<void> _onFetchAnimeList(
    FetchAnimeListEvent event,
    Emitter<AnimeListState> emit,
  ) async {
    try {
      if (event.reset) {
        emit(
          AnimeListLoading(
            animes: const [],
            hasReachedMax: false,
            currentType: event.type,
            currentFilter: event.filter,
          ),
        );
      } else {
        emit(
          AnimeListLoading(
            animes: List<AnimeEntity>.from(state.animes),
            hasReachedMax: state.hasReachedMax,
            currentType: state.currentType,
            currentFilter: state.currentFilter,
          ),
        );
      }

      final result = await getTopAnimeUseCase(
        event.page,
        type: event.type,
        filter: event.filter,
      );

      result.fold(
        (exception) {
          locator<ExceptionHandler>().recordError(
            exception,
            StackTrace.current,
          );
          emit(
            AnimeListError(
              message: exception.toString(),
              animes: state.animes,
              hasReachedMax: state.hasReachedMax,
              currentType: state.currentType,
              currentFilter: state.currentFilter,
            ),
          );
        },
        (animes) {
          final hasReachedMax = animes.isEmpty;
          final updatedAnimes = event.reset ? List<AnimeEntity>.from(animes) : List<AnimeEntity>.from(state.animes)
            ..addAll(animes);
          emit(
            AnimeListLoaded(
              animes: updatedAnimes,
              hasReachedMax: hasReachedMax,
              currentType: event.type ?? state.currentType,
              currentFilter: event.filter ?? state.currentFilter,
            ),
          );
        },
      );
    } catch (e) {
      locator<ExceptionHandler>().recordError(
        e,
        StackTrace.current,
      );
      emit(
        AnimeListError(
          message: e.toString(),
          animes: state.animes,
          hasReachedMax: state.hasReachedMax,
          currentType: state.currentType,
          currentFilter: state.currentFilter,
        ),
      );
    }
  }

  Future<void> _onChangeFilter(
    ChangeFilterEvent event,
    Emitter<AnimeListState> emit,
  ) async {
    emit(
      AnimeListLoading(
        animes: const [],
        hasReachedMax: false,
        currentType: event.type,
        currentFilter: event.filter,
      ),
    );
    add(
      FetchAnimeListEvent(
        page: 1,
        type: event.type,
        filter: event.filter,
        reset: true,
      ),
    );
  }
}
