import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app/view/home/data/datasource/local/movie_service.dart';
import 'package:movie_app/app/view/home/data/model/movie_list_response_model.dart';
import 'package:movie_app/app/view/home/presentation/widgets/image_widget.dart';

import '../../../../core/route/app_route.gr.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class NowPlayingWidget extends StatefulWidget {
  final List<Result> movies;
  final String title;

  const NowPlayingWidget({super.key, required this.movies,required this.title});

  @override
  State<NowPlayingWidget> createState() => _NowPlayingWidgetState();
}

class _NowPlayingWidgetState extends State<NowPlayingWidget> {
  final ScrollController _scrollController = ScrollController();

  void _scrollRight() {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final target = (_scrollController.offset + 150).clamp(0, maxScroll).toDouble();
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollLeft() {
    if (_scrollController.hasClients) {
      final target = (_scrollController.offset - 150).clamp(0, _scrollController.position.maxScrollExtent).toDouble();
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final movies = widget.movies;
    MovieService favoriteService = MovieService();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Align(
           alignment: Alignment.centerLeft,
           child: GestureDetector(
             onTap: (){
               context.router.push(MovieListWidget(movies: movies, title: widget.title));
             },
             child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_right,size: 30,),
                ],
              ),
                     ),
           ),
         ),
        if(movies.isEmpty)Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          child: Text('No Record',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.error),
          ),
        )
        else SizedBox(
          height: 180,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListView.separated(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 40), // add padding for buttons
                itemCount: movies.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return GestureDetector(
                    onTap: () {
                      context.router.push(MovieDetailRoute(movie: movie));
                    },
                    child: SizedBox(
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              children: [
                                ImageWidget(path: movie.posterPath, name: movie.title,width: 120,height: 140,),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: IconButton(
                                    icon: Icon(
                                      favoriteService.isFavorite(movie.id) ? Icons.favorite : Icons.favorite_border,
                                      size: 30,
                                      color: favoriteService.isFavorite(movie.id) ? Colors.red : Colors.white,
                                    ),
                                    onPressed: () {
                                      favoriteService.toggleFavorite(movie);
                                      context.read<HomeBloc>().add(RefreshFavouriteEvent(id: movie.id));
                                      // setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            movie.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: arrow(onPressed: _scrollLeft, icon: Icon(Icons.arrow_back_ios)),
              ),

              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: arrow(onPressed: _scrollRight, icon: Icon(Icons.arrow_forward_ios)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container arrow({required void Function() onPressed, required Icon icon}) {
    return Container(
      width: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.transparent, Colors.white.withOpacity(0.8)],
        ),
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
