import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application_layer/di/locator.dart';

import '../../../../application_layer/constants/string_constants.dart';
import '../bloc/anime_detail_bloc.dart';

class AnimeDetailPage extends StatelessWidget {
  final int animeId;

  const AnimeDetailPage({
    Key? key,
    @PathParam(StringConstants.animeIdParam) required this.animeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimeDetailBloc>(
      create: (_) => locator<AnimeDetailBloc>()..add(FetchAnimeDetailEvent(animeId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringConstants.animeDetailTitle),
        ),
        body: BlocBuilder<AnimeDetailBloc, AnimeDetailState>(
          builder: (context, state) {
            if (state is AnimeDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AnimeDetailLoaded) {
              final anime = state.anime;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (anime.imageUrl.isNotEmpty)
                      Image.network(
                        anime.imageUrl,
                        errorBuilder: (context, error, stackTrace) => const SizedBox(
                          height: 200,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: Icon(Icons.error),
                          ),
                        ),
                      )
                    else
                      const SizedBox(
                        key: Key(
                          StringConstants.animeDetailSizedBoxKey,
                        ),
                        height: 200,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    const SizedBox(height: 8),
                    Text(
                      anime.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (anime.score != null) Text('${StringConstants.scoreText}${anime.score}'),
                    if (anime.episodes != null) Text('${StringConstants.episodesText}${anime.episodes}'),
                    if (anime.genres != null && anime.genres!.isNotEmpty)
                      Text(
                        '${StringConstants.genresText}${anime.genres!.join(', ')}',
                      ),
                    if (anime.synopsis != null) Text('${StringConstants.synopsisText}${anime.synopsis}'),
                    if (anime.characters != null && anime.characters!.isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          StringConstants.charactersText,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (anime.characters != null && anime.characters!.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: anime.characters!.length,
                        itemBuilder: (context, index) {
                          final character = anime.characters![index];
                          return ListTile(
                            leading: character.imageUrl != null && character.imageUrl!.isNotEmpty
                                ? Image.network(
                                    character.imageUrl!,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => const SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                        ),
                                        child: Icon(Icons.error),
                                      ),
                                    ),
                                  )
                                : const SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                            title: Text(
                              character.name ?? StringConstants.unknownCharacter,
                            ),
                          );
                        },
                      ),
                  ],
                ),
              );
            } else if (state is AnimeDetailError) {
              return Center(
                child: Text('${StringConstants.errorText}${state.message}'),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
