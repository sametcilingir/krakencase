class StringConstants {
  static const String animeCardPlaceholderKey = 'anime_card_placeholder';
  static const String animeCardGestureDetectorKey = 'anime_card_gesture_detector';
  static const String animeDetailSizedBoxKey = 'anime_detail_sized_box';

  static const String scoreText = 'Score: ';
  static const String animeIdParam = 'animeId';
  static const String animeDetailTitle = 'Anime Detail';
  static const String episodesText = 'Episodes: ';
  static const String genresText = 'Genres: ';
  static const String synopsisText = 'Synopsis: ';
  static const String charactersText = 'Characters:';
  static const String errorText = 'Error: ';
  static const String unknownCharacter = 'Unknown Character';
  static const String allText = 'All';
  static const Map<String, String> typeOptionsMap = {
    'All': "all",
    'TV': 'tv',
    'Movie': 'movie',
    'OVA': 'ova',
    'Special': 'special',
    'ONA': 'ona',
    'Music': 'music',
    'CM': 'cm',
    'PV': 'pv',
    'TV Special': 'tv_special',
  };
  static const Map<String, String> filterOptionsMap = {
    'All': "all",
    'Airing': 'airing',
    'Upcoming': 'upcoming',
    'By Popularity': 'bypopularity',
    'Favorite': 'favorite',
  };
  static const String fetchAnimeListMethod = 'fetchAnimeList';
  static const String animeListTitle = 'Anime List';
  static const String listViewKey = 'ListView';
  static const String noAnimeFoundText = 'No anime found';
  static const String failedToLoadTopAnime = 'Failed to load top anime';
  static const String failedToLoadAnimeDetail = 'Failed to load anime detail';
  static const String failedToLoadAnimeCharacters = 'Failed to load anime characters';
}
