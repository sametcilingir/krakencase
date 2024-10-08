part of 'anime_detail_bloc.dart';

abstract class AnimeDetailEvent extends Equatable {
  const AnimeDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchAnimeDetailEvent extends AnimeDetailEvent {
  final int id;

  const FetchAnimeDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
