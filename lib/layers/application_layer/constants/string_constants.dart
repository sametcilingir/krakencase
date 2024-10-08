class StringConstants {
  static const String animeCardPlaceholderKey = 'anime_card_placeholder';
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
  static const Map<String, String?> typeOptionsMap = {
    'All': null,
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
  static const Map<String, String?> filterOptionsMap = {
    'All': null,
    'Airing': 'airing',
    'Upcoming': 'upcoming',
    'By Popularity': 'bypopularity',
    'Favorite': 'favorite',
  };
  static const String fetchAnimeListMethod = 'fetchAnimeList';
  static const String animeListTitle = 'Anime List';
  static const String listViewKey = 'ListView';
}
