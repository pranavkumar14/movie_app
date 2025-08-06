import 'package:equatable/equatable.dart';

import '../../data/model/movie_list_response_model.dart';

class MovieListEntity extends Equatable{
  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  const MovieListEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object?> get props => [page,results,totalPages,totalResults];
  factory MovieListEntity.fromResults(List<Result> results) {
    return MovieListEntity(
      page: 1,
      totalPages: 1,
      totalResults: 20,
      results: results.map((e) => e).toList(),
    );
  }

}