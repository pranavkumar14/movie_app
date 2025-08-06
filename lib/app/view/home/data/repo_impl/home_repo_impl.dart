

import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/global/error/failure.dart';
import 'package:movie_app/app/global/resources/use_case_request_model.dart';
import 'package:movie_app/app/view/home/data/datasource/local/movie_service.dart';
import 'package:movie_app/app/view/home/data/datasource/remote/home_datasource.dart';
import 'package:movie_app/app/view/home/data/model/search_query_request_model.dart';
import 'package:movie_app/app/view/home/domain/entity/movie_list_entity.dart';
import 'package:movie_app/app/view/home/domain/repository/home_repository.dart';

import '../../../../global/resources/api_response_status_model.dart';
import '../model/movie_list_response_model.dart';

@LazySingleton(as: HomeRepository)
class HomeRepoImpl implements HomeRepository{
  HomeRepoImpl({required this.homeRemoteDataSource});
  HomeRemoteDataSource homeRemoteDataSource;
  @override
  Future<Either<Failure, MovieListEntity>> getTrendingMovies({required UseCaseRequestModel useCaseRequestModel}) async {
    try {
      var response = await homeRemoteDataSource.getTrendingMovies(
          useCaseRequestModel: useCaseRequestModel);
      if (response.status == APIResponseStatusModel.success) {
        final movieList = response.body!.results;
        await MovieService().cacheTrendingMovies(movieList);
        return Right(response.body!.toEntity());
      } else {
        final cached = MovieService().getTrendingMovies();
        if (cached.isNotEmpty) {
          return Right(MovieListEntity.fromResults(cached));
        }
        else{
          String jsonString = await rootBundle.loadString('assets/data/trending_movies.json');
          final jsonData = movieListResponseModelFromJson(jsonString).toEntity();
          return Right(jsonData);
        }
        return Left(Error(message:response.message ?? '',));
      }
    } catch (e) {
      final cached = MovieService().getTrendingMovies();
      if (cached.isNotEmpty) {
        return Right(MovieListEntity.fromResults(cached));
      }
      return _handleError(e);
    }
  }

  @override
  Future<Either<Failure, MovieListEntity>> getNowPlayingMovies({required UseCaseRequestModel useCaseRequestModel}) async {
    try {
      var response = await homeRemoteDataSource.getNowPlayingMovies(
          useCaseRequestModel: useCaseRequestModel);
      if (response.status == APIResponseStatusModel.success) {
        final movieList = response.body!.results;
        await MovieService().cacheNowPlayingMovies(movieList);
        return Right(response.body!.toEntity());
      } else {
        final cached = MovieService().getNowPlayingMovies();
        if (cached.isNotEmpty) {
          return Right(MovieListEntity.fromResults(cached));
        }
        else{
          String jsonString = await rootBundle.loadString('assets/data/now_playing.json');
          final jsonData = movieListResponseModelFromJson(jsonString).toEntity();
          return Right(jsonData);
        }
        return Left(Error(message:response.message ?? '',));
      }
    } catch (e) {
      final cached = MovieService().getNowPlayingMovies();
      if (cached.isNotEmpty) {
        return Right(MovieListEntity.fromResults(cached));
      }
      return _handleError(e);
    }
  }

  @override
  Future<Either<Failure, MovieListEntity>> searchMovies({required UseCaseRequestModel<SearchQueryRequestModel> useCaseRequestModel}) async {
    try {
      var response = await homeRemoteDataSource.searchMovies(
          useCaseRequestModel: useCaseRequestModel);
      if (response.status == APIResponseStatusModel.success) {
        return Right(response.body!.toEntity());
      } else {
        return Left(Error(message:response.message ?? '',));
      }
    } catch (e) {
      return _handleError(e);
    }
  }




  Future<Either<Failure, T>> _handleError<T>(dynamic e) {
    if (e is SocketException) {
      return Future.value(
        const Left(ConnectionFailure(message: 'Failed to connect to the network')),
      );
    } else {
      return Future.value(
        const Left(ServerFailure(message: 'An error has occurred')),
      );
    }
  }

}