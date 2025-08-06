import 'package:equatable/equatable.dart';
import 'package:movie_app/app/global/resources/use_case_request_model.dart';
import 'package:movie_app/app/view/home/data/model/search_query_request_model.dart';

abstract class HomeEvent extends Equatable{}

class GetTrendingMoviesEvent extends HomeEvent{
  @override
  List<Object?> get props => [];
}
class GetNowPlayingEvent extends HomeEvent{
  @override
  List<Object?> get props => [];
}
class SearchMoviesEvent extends HomeEvent{
  final UseCaseRequestModel<SearchQueryRequestModel> useCaseRequestModel;
  SearchMoviesEvent({required this.useCaseRequestModel});
  @override
  List<Object?> get props => [useCaseRequestModel];
}
class RefreshFavouriteEvent extends HomeEvent{
  final int id;
  RefreshFavouriteEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
class FetchFavouriteEvent extends HomeEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}