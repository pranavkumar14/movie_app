import 'package:movie_app/app/view/home/data/model/search_query_request_model.dart';
import 'package:movie_app/app/view/home/domain/entity/movie_list_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../global/error/failure.dart';
import '../../../../global/resources/use_case_request_model.dart';

abstract class HomeRepository{
  Future<Either<Failure,MovieListEntity> > getTrendingMovies({required UseCaseRequestModel useCaseRequestModel});
  Future<Either<Failure,MovieListEntity> > getNowPlayingMovies({required UseCaseRequestModel useCaseRequestModel});
  Future<Either<Failure,MovieListEntity> > searchMovies({required UseCaseRequestModel<SearchQueryRequestModel> useCaseRequestModel});
}