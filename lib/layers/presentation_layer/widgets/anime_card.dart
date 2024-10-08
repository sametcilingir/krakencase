import 'package:flutter/material.dart';
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart';

import '../../application_layer/constants/string_constants.dart';

class AnimeCard extends StatelessWidget {
  final AnimeEntity anime;
  final VoidCallback? onTap;

  const AnimeCard({Key? key, required this.anime, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            anime.imageUrl.isNotEmpty
                ? Image.network(
                    anime.imageUrl,
                    fit: BoxFit.cover,
                  )
                : Container(
                    key: const Key(
                      StringConstants.animeCardPlaceholderKey,
                    ),
                    color: Colors.grey,
                    height: 200,
                    width: double.infinity,
                    child: const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.white,
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
