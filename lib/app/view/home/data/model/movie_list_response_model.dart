import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/app/view/home/data/datasource/local/movie_service.dart';
import 'dart:convert';

import 'package:movie_app/app/view/home/domain/entity/movie_list_entity.dart';

part 'movie_list_response_model.g.dart';

MovieListResponseModel movieListResponseModelFromJson(String str) => MovieListResponseModel.fromJson(json.decode(str));

String movieListResponseModelToJson(MovieListResponseModel data) => json.encode(data.toJson());


@JsonSerializable()
class MovieListResponseModel {
  @JsonKey(name: "page",defaultValue: 0)
  final int page;
  @JsonKey(name: "results",defaultValue: [])
  final List<Result> results;
  @JsonKey(name: "total_pages",defaultValue: 0)
  final int totalPages;
  @JsonKey(name: "total_results",defaultValue: 0)
  final int totalResults;

  MovieListResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  MovieListEntity toEntity(){
    MovieService favoriteService = MovieService();
    for(var result in results){
      result.isFavourite = favoriteService.isFavorite(result.id);
    }
    return MovieListEntity(page: page, results: results, totalPages: totalPages, totalResults: totalResults);
  }

  factory MovieListResponseModel.fromJson(Map<String, dynamic> json) => _$MovieListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "adult",defaultValue: false)
  final bool adult;
  @JsonKey(name: "backdrop_path",defaultValue: '')
  final String backdropPath;
  @JsonKey(name: "id",defaultValue: 0)
  final int id;
  @JsonKey(name: "title",defaultValue: '')
  final String title;
  @JsonKey(name: "original_title",defaultValue: '')
  final String originalTitle;
  @JsonKey(name: "overview",defaultValue: '')
  final String overview;
  @JsonKey(name: "poster_path",defaultValue: '')
  final String posterPath;
  @JsonKey(name: "media_type",defaultValue: '')
  final String mediaType;
  @JsonKey(name: "original_language",defaultValue: '')
  final String originalLanguage;
  @JsonKey(name: "genre_ids",defaultValue: [])
  final List<int> genreIds;
  @JsonKey(name: "popularity",defaultValue: 0)
  final double popularity;
  @JsonKey(name: "release_date",fromJson: _parseDate, toJson: _dateToJson)
  final DateTime? releaseDate;
  @JsonKey(name: "video",defaultValue: false)
  final bool video;
  @JsonKey(name: "vote_average",defaultValue: 0)
  final double voteAverage;
  @JsonKey(name: "vote_count",defaultValue: 0)
  final int voteCount;
  @JsonKey(name: "is_favourite",defaultValue: false)
  bool isFavourite;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.isFavourite = false,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

DateTime? _parseDate(String? date) {
  if (date == null || date.isEmpty) return null;
  return DateTime.tryParse(date);
}

String? _dateToJson(DateTime? date) => date?.toIso8601String();

