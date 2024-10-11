import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../application_layer/di/locator.dart';
import '../../../../application_layer/handlers/exception_handler.dart';
import '../../../../domain_layer/entities/anime_entity.dart';
import '../../../../domain_layer/usecases/get_anime_detail_usecase.dart';

part 'anime_detail_event.dart';
part 'anime_detail_state.dart';

@injectable
class AnimeDetailBloc extends Bloc<AnimeDetailEvent, AnimeDetailState> {
  final GetAnimeDetailUseCase getAnimeDetailUseCase;

  AnimeDetailBloc(this.getAnimeDetailUseCase) : super(AnimeDetailInitial()) {
    on<FetchAnimeDetailEvent>(_onFetchAnimeDetail);
  }

  Future<void> _onFetchAnimeDetail(
    FetchAnimeDetailEvent event,
    Emitter<AnimeDetailState> emit,
  ) async {
    emit(AnimeDetailLoading());
    final result = await getAnimeDetailUseCase(event.id);
    result.fold(
      (exception) {
        locator<ExceptionHandler>().recordError(
          exception,
          StackTrace.current,
        );
        emit(AnimeDetailError(exception.toString()));
      },
      (anime) => emit(AnimeDetailLoaded(anime)),
    );
  }
}
