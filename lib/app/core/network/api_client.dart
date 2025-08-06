import 'package:dio/dio.dart';
import 'package:movie_app/app/view/home/data/model/movie_list_response_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("trending/movie/day")
  Future<MovieListResponseModel> getTrendingMovies();

  @GET("movie/now_playing")
  Future<MovieListResponseModel> getNowPlayingMovies();

  @GET("search/movie")
  Future<MovieListResponseModel> searchMovies(
      @Query("query") String query,
      @Query("page") int page,
      );
}
