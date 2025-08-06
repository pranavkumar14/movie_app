import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/core/network/api_client.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Future<Dio> dio() async {
    final apiKey = dotenv.env['API_KEY'];
    return Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3/",
    headers: {
      "Authorization": "Bearer $apiKey",
      "Accept": "application/json",
    },
  ));
  }

  @lazySingleton
  ApiClient apiClient(Dio dio) => ApiClient(dio);
}
