import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../data/model/movie_list_response_model.dart';
import 'movie_card_widget.dart';

@RoutePage()
class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key,required this.movies,required this.title});
  final List<Result> movies;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                GestureDetector(
                  child: Icon(Icons.arrow_back_ios),
                  onTap: (){
                    context.router.back();
                  },
                ),
                Text(title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: movies.isNotEmpty
                ? movies.map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: MovieCardWidget(movie: e),
              )).toList()
                : [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Text(
                      'No Record',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.error),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
