import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';

class MovieSearchItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieSearchItem({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: movie.posterPath,
          width: size.width * 0.3,
         height: 300,
         fit: BoxFit.cover,
         
        ),
      ),
      title: Text(movie.title, style: TextStyle(color: colors.primary),),
      subtitle: Text(movie.overview, maxLines: 2, style: TextStyle(color: colors.onSurface),),
      onTap: onTap,
    );
  }
}