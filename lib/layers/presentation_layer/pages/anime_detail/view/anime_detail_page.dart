import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krakencase/layers/application_layer/constants/string_constants.dart';
import '../../../../application_layer/di/locator.dart';
import '../bloc/anime_detail_bloc.dart';

class AnimeDetailPage extends StatefulWidget {
  final int animeId;

  const AnimeDetailPage({
    Key? key,
    @PathParam(StringConstants.animeIdParam) required this.animeId,
  }) : super(key: key);

  @override
  State<AnimeDetailPage> createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  late AnimeDetailBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = locator<AnimeDetailBloc>();
    _bloc.add(FetchAnimeDetailEvent(widget.animeId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.animeDetailTitle),
      ),
      body: BlocBuilder<AnimeDetailBloc, AnimeDetailState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is AnimeDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AnimeDetailLoaded) {
            final anime = state.anime;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  anime.imageUrl.isNotEmpty
                      ? Image.network(anime.imageUrl)
                      : Container(height: 200, color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      anime.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (anime.score != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${StringConstants.scoreText}${anime.score}'),
                    ),
                  if (anime.episodes != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${StringConstants.episodesText}${anime.episodes}',
                      ),
                    ),
                  if (anime.genres != null && anime.genres!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${StringConstants.genresText}${anime.genres!.join(', ')}',
                      ),
                    ),
                  if (anime.synopsis != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${StringConstants.synopsisText}${anime.synopsis}',
                      ),
                    ),
                  if (anime.characters != null && anime.characters!.isNotEmpty)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
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
                          leading: character.imageUrl != null
                              ? Image.network(character.imageUrl!)
                              : Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.grey,
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
    );
  }
}
