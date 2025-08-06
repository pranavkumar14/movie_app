import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app/view/home/data/datasource/local/movie_service.dart';
import 'package:movie_app/app/view/home/domain/entity/movie_list_entity.dart';
import 'package:movie_app/app/view/home/presentation/bloc/home_state.dart';
import 'package:movie_app/app/view/home/presentation/widgets/image_widget.dart';

import '../../../../core/route/app_route.gr.dart';
import '../../data/model/movie_list_response_model.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class MovieCardWidget extends StatelessWidget {
  final Result movie;

  const MovieCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    MovieService favoriteService = MovieService();
    return GestureDetector(
      onTap: (){
        context.router.push(MovieDetailRoute(movie: movie));
      },
      child: SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    ImageWidget(path: movie.posterPath, name: movie.originalTitle),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        icon: Icon(
                          favoriteService.isFavorite(movie.id) ? Icons.favorite : Icons.favorite_border,
                          size: 25,
                          color: favoriteService.isFavorite(movie.id) ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          favoriteService.toggleFavorite(movie);
                          context.read<HomeBloc>().add(RefreshFavouriteEvent(id: movie.id));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
