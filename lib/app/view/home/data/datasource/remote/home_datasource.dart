import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/global/resources/api_response_status_model.dart';
import 'package:movie_app/app/global/resources/use_case_request_model.dart';
import 'package:movie_app/app/view/home/data/model/movie_list_response_model.dart';
import 'package:movie_app/app/view/home/data/model/search_query_request_model.dart';

import '../../../../../core/network/api_client.dart';

abstract class HomeRemoteDataSource {
  Future<APIResponseStatusModel<MovieListResponseModel>> getTrendingMovies({required UseCaseRequestModel useCaseRequestModel});
  Future<APIResponseStatusModel<MovieListResponseModel>> getNowPlayingMovies({required UseCaseRequestModel useCaseRequestModel});
  Future<APIResponseStatusModel<MovieListResponseModel>> searchMovies({required UseCaseRequestModel<SearchQueryRequestModel> useCaseRequestModel});
}


@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<APIResponseStatusModel<MovieListResponseModel>> getTrendingMovies({required UseCaseRequestModel useCaseRequestModel}) async {
    try {
      final response = await apiClient.getTrendingMovies();
        return APIResponseStatusModel<MovieListResponseModel>(
          status:APIResponseStatusModel.success,
          message:null,
          body:response,
        );
      } on DioException catch(e){
        return APIResponseStatusModel<MovieListResponseModel>(
          status:APIResponseStatusModel.failure,
          message:e.message,
          body:null,
        );
      } catch (e) {
      return APIResponseStatusModel<MovieListResponseModel>(
        status:APIResponseStatusModel.failure,
        message:e.toString(),
        body:null,
      );
    }
  }

  @override
  Future<APIResponseStatusModel<MovieListResponseModel>> getNowPlayingMovies({required UseCaseRequestModel useCaseRequestModel}) async {
    try {
      final response = await apiClient.getNowPlayingMovies();
      return APIResponseStatusModel<MovieListResponseModel>(
        status:APIResponseStatusModel.success,
        message:null,
        body:response,
      );
    } on DioException catch(e){
      return APIResponseStatusModel<MovieListResponseModel>(
        status:APIResponseStatusModel.failure,
        message:e.message,
        body:null,
      );
    } catch (e) {
      return APIResponseStatusModel<MovieListResponseModel>(
        status:APIResponseStatusModel.failure,
        message:e.toString(),
        body:null,
      );
    }
  }

  @override
  Future<APIResponseStatusModel<MovieListResponseModel>> searchMovies({required UseCaseRequestModel useCaseRequestModel}) async {
    try {
      final response = await apiClient.searchMovies(useCaseRequestModel.body.query,useCaseRequestModel.body.pages);
      return APIResponseStatusModel<MovieListResponseModel>(
        status:APIResponseStatusModel.success,
        message:null,
        body:response,
      );
    } on DioException catch(e){
      return APIResponseStatusModel<MovieListResponseModel>(
        status:APIResponseStatusModel.failure,
        message:e.message,
        body:null,
      );
    } catch (e) {
      return APIResponseStatusModel<MovieListResponseModel>(
        status:APIResponseStatusModel.failure,
        message:e.toString(),
        body:null,
      );
    }
  }
}
