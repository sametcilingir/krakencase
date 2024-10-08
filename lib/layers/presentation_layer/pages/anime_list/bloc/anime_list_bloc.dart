import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain_layer/entities/anime_entity.dart';
import '../../../../domain_layer/usecases/get_top_anime_usecase.dart';
import 'package:injectable/injectable.dart';

part 'anime_list_event.dart';
part 'anime_list_state.dart';

@injectable
class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  final GetTopAnimeUseCase getTopAnimeUseCase;

  AnimeListBloc(this.getTopAnimeUseCase) : super(const AnimeListInitial()) {
    on<FetchAnimeListEvent>((event, emit) async {
      emit(AnimeListLoading(List<AnimeEntity>.from(state.animes)));

      final result = await getTopAnimeUseCase(
        event.page,
        type: event.type,
        filter: event.filter,
      );
      result.fold(
        (exception) => emit(
          AnimeListError(
            exception.toString(),
            List<AnimeEntity>.from(state.animes),
          ),
        ),
        (animes) {
          final updatedAnimes = event.reset
              ? List<AnimeEntity>.from(animes)
              : List<AnimeEntity>.from(state.animes)
            ..addAll(animes);
          emit(AnimeListLoaded(updatedAnimes));
        },
      );
    });
  }
}
