part of 'anime_list_bloc.dart';

abstract class AnimeListEvent extends Equatable {
  const AnimeListEvent();

  @override
  List<Object?> get props => [];
}

class FetchAnimeListEvent extends AnimeListEvent {
  final int page;
  final String? type;
  final String? filter;
  final bool reset;

  const FetchAnimeListEvent({
    required this.page,
    this.type,
    this.filter,
    this.reset = false,
  });

  @override
  List<Object?> get props => [page, type, filter, reset];
}

class ChangeFilterEvent extends AnimeListEvent {
  final String? type;
  final String? filter;

  const ChangeFilterEvent({this.type, this.filter});

  @override
  List<Object?> get props => [type, filter];
}

class CallMethodChannelEvent extends AnimeListEvent {
  const CallMethodChannelEvent();

  @override
  List<Object?> get props => [];
}
