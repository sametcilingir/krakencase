import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain_layer/entities/anime_entity.dart';
import '../../../../domain_layer/usecases/get_anime_detail_usecase.dart';

part 'anime_detail_event.dart';
part 'anime_detail_state.dart';

@injectable
class AnimeDetailBloc extends Bloc<AnimeDetailEvent, AnimeDetailState> {
  final GetAnimeDetailUseCase getAnimeDetailUseCase;

  AnimeDetailBloc(this.getAnimeDetailUseCase) : super(AnimeDetailInitial()) {
    on<FetchAnimeDetailEvent>((event, emit) async {
      emit(AnimeDetailLoading());
      final result = await getAnimeDetailUseCase(event.id);
      result.fold(
        (exception) => emit(AnimeDetailError(exception.toString())),
        (anime) => emit(AnimeDetailLoaded(anime)),
      );
    });
  }
}
