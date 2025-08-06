import 'package:hive/hive.dart';
import 'package:movie_app/app/view/home/data/model/movie_list_response_model.dart';

class MovieService {
  static const String _boxName = 'favorite_movies';
  final Box<Map> _box = Hive.box<Map>(_boxName);

  void toggleFavorite(Result movie) {
    if (isFavorite(movie.id)) {
      _box.delete(movie.id);
    } else {
      _box.put(movie.id, movie.toJson()); // Store as Map
    }
  }

  bool isFavorite(int id) => _box.containsKey(id);

  Result? getFavorite(int id) {
    final map = _box.get(id);
    if (map != null) {
      return Result.fromJson(Map<String, dynamic>.from(map));
    }
    return null;
  }

  List<Result> getFavorites() {
    return _box.values
        .map((e) => Result.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
  static const String trendingBox = 'trending_movies';
  static const String nowPlayingBox = 'now_playing_movies';

  Future<void> cacheTrendingMovies(List<Result> movies) async {
    final box = Hive.box(trendingBox);
    await box.put('list', movies.map((e) => e.toJson()).toList());
  }

  Future<void> cacheNowPlayingMovies(List<Result> movies) async {
    final box = Hive.box(nowPlayingBox);
    await box.put('list', movies.map((e) => e.toJson()).toList());
  }

  List<Result> getTrendingMovies() {
    final box = Hive.box(trendingBox);
    final list = box.get('list', defaultValue: []);
    return List<Map>.from(list).map((e) => Result.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  List<Result> getNowPlayingMovies() {
    final box = Hive.box(nowPlayingBox);
    final list = box.get('list', defaultValue: []);
    return List<Map>.from(list).map((e) => Result.fromJson(Map<String, dynamic>.from(e))).toList();
  }
}
