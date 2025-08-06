import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/global/error/failure.dart';
import 'package:movie_app/app/global/resources/use_case_request_model.dart';
import 'package:movie_app/app/view/home/domain/entity/movie_list_entity.dart';
import 'package:movie_app/app/view/home/domain/repository/home_repository.dart';
import '../../../../global/resources/usecase.dart';

@LazySingleton()
class GetTrendingMoviesUseCase
    extends UseCase<Either<Failure,MovieListEntity>, UseCaseRequestModel> {
  GetTrendingMoviesUseCase(this.repository);
  final HomeRepository repository;

  @override
  Future<Either<Failure,MovieListEntity>> call({
    required UseCaseRequestModel params,
  }) async {
    return repository.getTrendingMovies(
      useCaseRequestModel:  params,
    );
  }
}
