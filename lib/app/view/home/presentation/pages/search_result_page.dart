import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app/global/resources/bloc_status_enum.dart';
import 'package:movie_app/app/view/home/data/model/search_query_request_model.dart';
import 'package:movie_app/app/view/home/presentation/bloc/home_bloc.dart';
import 'package:movie_app/app/view/home/presentation/bloc/home_event.dart';
import 'package:movie_app/app/view/home/presentation/bloc/home_state.dart';
import 'package:movie_app/app/view/home/presentation/widgets/movie_card_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../global/resources/use_case_request_model.dart';

@RoutePage()
class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key,@QueryParam('query') this.query='',});
  final String query;

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  ScrollController scrollController = ScrollController();
  int pageNumber = 1;
  int totalPages = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(SearchMoviesEvent(useCaseRequestModel: UseCaseRequestModel(body: SearchQueryRequestModel(pages: 1, query: widget.query))));
    scrollController.addListener(() {
      scrollListener();
    });
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (pageNumber < totalPages) {
        pageNumber++;
        context.read<HomeBloc>().add(SearchMoviesEvent(
            useCaseRequestModel: UseCaseRequestModel(
                body: SearchQueryRequestModel(pages: pageNumber, query: widget.query))));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text( 'Search Result for "${widget.query}"'),
         ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              context.router.back();
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if(state.searchMoviesStatus.isError){
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
              if (state.searchMoviesStatus.isSuccess) {
                totalPages = state.searchMoviesList!.totalPages;
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height - 200,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: state.searchMoviesList!.results.isNotEmpty
                          ? [
                        ...state.searchMoviesList!.results
                            .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MovieCardWidget(movie: e),
                            )),
                        if (pageNumber < totalPages)
                           SizedBox(
                            width: 100.0,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.grey,
                              child: SizedBox(),
                            ),
                          ),
                      ]
                          : [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                              child: Text(
                                'No Record',
                                style: Theme.of(context).textTheme.titleMedium,
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox();
            }),
      ],
    );
  }
}
