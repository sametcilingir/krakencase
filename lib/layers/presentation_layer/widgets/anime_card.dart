import 'package:flutter/material.dart';
import '../../domain_layer/entities/anime_entity.dart';

import '../../application_layer/constants/string_constants.dart';

class AnimeCard extends StatelessWidget {
  final AnimeEntity anime;
  final VoidCallback? onTap;

  const AnimeCard({Key? key, required this.anime, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key(StringConstants.animeCardGestureDetectorKey),
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            anime.imageUrl.isNotEmpty
                ? Image.network(
                    anime.imageUrl,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(
                    key: Key(StringConstants.animeCardPlaceholderKey),
                    height: 200,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Icon(Icons.error),
                    ),
                  ),
            ListTile(
              title: Text(anime.title),
              subtitle: Text('${StringConstants.scoreText}${anime.score}'),
            ),
          ],
        ),
      ),
    );
  }
}
