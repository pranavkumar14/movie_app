import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app/view/home/data/datasource/local/movie_service.dart';
import 'package:movie_app/app/view/home/data/model/movie_list_response_model.dart';
import 'package:movie_app/app/view/home/presentation/bloc/home_event.dart';
import 'package:movie_app/app/view/home/presentation/widgets/image_widget.dart';

import '../../../../core/route/app_route.gr.dart';
import '../bloc/home_bloc.dart';

class MovieTrendingWidget extends StatelessWidget {
  const MovieTrendingWidget({super.key,required this.movies});
  final List<Result> movies;

  @override
  Widget build(BuildContext context) {
    MovieService favoriteService = MovieService();
    return CarouselSlider.builder(
      itemCount: movies.length,
      itemBuilder: (context, index, realIdx) {
        final movie = movies[index];

        return Stack(
          children: [
            GestureDetector(
              onTap: (){
                context.router.push(MovieDetailRoute(movie: movie));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ImageWidget(path: movie.backdropPath, name: movie.backdropPath,width: double.infinity,),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                icon: Icon(
                  favoriteService.isFavorite(movie.id) ? Icons.favorite : Icons.favorite_border,
                  size: 30,
                  color: favoriteService.isFavorite(movie.id) ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  favoriteService.toggleFavorite(movie);
                  context.read<HomeBloc>().add(RefreshFavouriteEvent(id: movie.id));
                },
              ),
            ),

            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black54, Colors.transparent],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: IgnorePointer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          movie.voteAverage.toStringAsFixed(1),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          movie.releaseDate!=null ? movie.releaseDate!.year.toString() :'',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.95,
      ),
    );
  }
}
