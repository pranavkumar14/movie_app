import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/app/global/resources/bloc_status_enum.dart';
import 'package:movie_app/app/global/resources/use_case_request_model.dart';
import 'package:movie_app/app/view/home/data/model/search_query_request_model.dart';
import 'package:movie_app/app/view/home/presentation/bloc/home_bloc.dart';
import 'package:movie_app/app/view/home/presentation/bloc/home_event.dart';
import 'package:movie_app/app/view/home/presentation/widgets/movie_trending_widget.dart';
import 'package:movie_app/app/view/home/presentation/widgets/now_playing_widget.dart';
import '../../../../core/route/app_route.gr.dart';
import '../bloc/home_state.dart';
import '../widgets/movies_search_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetTrendingMoviesEvent());
    context.read<HomeBloc>().add(GetNowPlayingEvent());
    context.read<HomeBloc>().add(FetchFavouriteEvent());
    context.read<HomeBloc>().add(SearchMoviesEvent(useCaseRequestModel: UseCaseRequestModel(body: SearchQueryRequestModel(pages: 1, query: 'The'))));
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            MovieSearchBarWidget(
                controller: controller,
                onChanged: (search){
                  if(search.length>2){
                    context.read<HomeBloc>().add(SearchMoviesEvent(
                        useCaseRequestModel: UseCaseRequestModel(
                            body: SearchQueryRequestModel(query: search,pages: 1)
                        )
                    ));
                  }
                },
                onSelected: (value) {
                  FocusScope.of(context).unfocus();
                  controller.text = '';
                  context.pushRoute(MovieDetailRoute(movie:value));
                },
                suggestionsBuilder: (search){
                  if(search.length>=2 && state.searchMoviesStatus.isSuccess){
                    final lst = state.searchMoviesList!.results;
                    return lst;
                  }
                  return [];
                }
            ),
            Builder(builder: (context){
              if(state.trendingMoviesStatus.isError){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    spacing: 10,
                    children: [
                      Text(state.errorMessage,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.error),),
                    ],
                  ),
                );
              }
              if (state.trendingMoviesStatus.isSuccess) {
                final movies = state.trendingMoviesList!.results;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap:(){
                        context.router.push(MovieListWidget(movies: movies, title: 'Trending Movies'));
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Text(
                              'Trending Movies',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.arrow_right,size: 30,),
                          ],
                        ),
                      ),
                    ),
                    MovieTrendingWidget(movies: movies,),
                  ],
                );

              }
              else if (state.trendingMoviesStatus.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return SizedBox();
            }),
            Builder(builder: (context){
              if (state.nowPlayingStatus.isSuccess) {
                final movies = state.nowPlayingList!.results;
                return NowPlayingWidget(movies: movies,title: 'Now Playing',);
              }
              else if (state.nowPlayingStatus.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return SizedBox();
            }),
            Builder(builder: (context){
              if (state.favouriteMovieStatus.isSuccess) {
                final movies = state.favouriteMovieList;
                return NowPlayingWidget(movies: movies,title: 'Saved Movies',);
              }
              return SizedBox();
            }),
          ],
        );

      },
    );
  }
}
