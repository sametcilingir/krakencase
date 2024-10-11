part of 'anime_list_bloc.dart';

abstract class AnimeListState extends Equatable {
  final List<AnimeEntity> animes;
  final bool hasReachedMax;
  final String? currentType;
  final String? currentFilter;

  const AnimeListState({
    this.animes = const [],
    this.hasReachedMax = false,
    this.currentType,
    this.currentFilter,
  });

  @override
  List<Object?> get props => [animes, hasReachedMax, currentType, currentFilter];
}

class AnimeListInitial extends AnimeListState {
  const AnimeListInitial() : super();
}

class AnimeListLoading extends AnimeListState {
  const AnimeListLoading({
    List<AnimeEntity> animes = const [],
    bool hasReachedMax = false,
    String? currentType,
    String? currentFilter,
  }) : super(
          animes: animes,
          hasReachedMax: hasReachedMax,
          currentType: currentType,
          currentFilter: currentFilter,
        );

  @override
  List<Object?> get props => [
        animes,
        hasReachedMax,
        currentType,
        currentFilter,
      ];
}

class AnimeListLoaded extends AnimeListState {
  const AnimeListLoaded({
    required List<AnimeEntity> animes,
    bool hasReachedMax = false,
    String? currentType,
    String? currentFilter,
  }) : super(
          animes: animes,
          hasReachedMax: hasReachedMax,
          currentType: currentType,
          currentFilter: currentFilter,
        );

  @override
  List<Object?> get props => [
        animes,
        hasReachedMax,
        currentType,
        currentFilter,
      ];
}

class AnimeListError extends AnimeListState {
  final String message;

  const AnimeListError({
    required this.message,
    List<AnimeEntity> animes = const [],
    bool hasReachedMax = false,
    String? currentType,
    String? currentFilter,
  }) : super(
          animes: animes,
          hasReachedMax: hasReachedMax,
          currentType: currentType,
          currentFilter: currentFilter,
        );

  @override
  List<Object?> get props => [message, animes, hasReachedMax, currentType, currentFilter];
}
