part of 'anime_list_bloc.dart';

abstract class AnimeListState extends Equatable {
  final List<AnimeEntity> animes;

  const AnimeListState(this.animes);

  @override
  List<Object?> get props => [animes];
}

class AnimeListInitial extends AnimeListState {
  const AnimeListInitial() : super(const []);
}

class AnimeListLoading extends AnimeListState {
  const AnimeListLoading(List<AnimeEntity> animes) : super(animes);
}

class AnimeListLoaded extends AnimeListState {
  const AnimeListLoaded(List<AnimeEntity> animes) : super(animes);
}

class AnimeListError extends AnimeListState {
  final String message;

  const AnimeListError(this.message, List<AnimeEntity> animes) : super(animes);

  @override
  List<Object?> get props => [message, animes];
}
