import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../global/resources/bloc_status_enum.dart';
import '../../data/model/movie_list_response_model.dart';
import '../../data/model/search_query_request_model.dart';
import '../../domain/entity/movie_list_entity.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default('') String errorMessage,
    @Default(BlocStatus.initial) BlocStatus trendingMoviesStatus,
    @Default(BlocStatus.initial) BlocStatus nowPlayingStatus,
    @Default(BlocStatus.initial) BlocStatus searchMoviesStatus,
    @Default(BlocStatus.initial) BlocStatus favouriteMovieStatus,
    MovieListEntity? trendingMoviesList,
    MovieListEntity? nowPlayingList,
    MovieListEntity? searchMoviesList,
    @Default([])List<Result> favouriteMovieList,
    SearchQueryRequestModel? searchQueryRequestModel,
  }) = _HomeState;
}
