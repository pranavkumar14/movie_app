import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/app/view/home/data/datasource/local/movie_service.dart';
import 'package:movie_app/app/view/home/presentation/widgets/image_widget.dart';

import '../../data/model/movie_list_response_model.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

@RoutePage()
class MovieDetailPage extends StatefulWidget {
  final Result movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    MovieService favoriteService = MovieService();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            children: [
              GestureDetector(
                child: Icon(Icons.arrow_back_ios),
                onTap: (){
                  context.router.back();
                },
              ),
              Text('Movie Details',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          Stack(
            children: [
              ImageWidget(path: widget.movie.posterPath, name: widget.movie.title),
              Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                    icon: Icon(
                      favoriteService.isFavorite(widget.movie.id) ? Icons.favorite : Icons.favorite_border,
                      size: 30,
                      color: favoriteService.isFavorite(widget.movie.id) ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      favoriteService.toggleFavorite(widget.movie);
                      context.read<HomeBloc>().add(RefreshFavouriteEvent(id: widget.movie.id));
                      setState(() {});
                    },
                  ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                widget.movie.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber),
              const SizedBox(width: 4),
              Text('${widget.movie.voteAverage}'),
              const SizedBox(width: 16),
              Text('Release: ${widget.movie.releaseDate!=null ? DateFormat('dd, MMM yyyy').format(widget.movie.releaseDate!) : ''}'),
            ],
          ),
          Text(widget.movie.overview),
        ],
      ),
    );
  }
}

