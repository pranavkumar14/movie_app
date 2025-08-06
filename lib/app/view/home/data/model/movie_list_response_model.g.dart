// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponseModel _$MovieListResponseModelFromJson(
  Map<String, dynamic> json,
) => MovieListResponseModel(
  page: (json['page'] as num?)?.toInt() ?? 0,
  results:
      (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  totalPages: (json['total_pages'] as num?)?.toInt() ?? 0,
  totalResults: (json['total_results'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$MovieListResponseModelToJson(
  MovieListResponseModel instance,
) => <String, dynamic>{
  'page': instance.page,
  'results': instance.results,
  'total_pages': instance.totalPages,
  'total_results': instance.totalResults,
};

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
  adult: json['adult'] as bool? ?? false,
  backdropPath: json['backdrop_path'] as String? ?? '',
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? '',
  originalTitle: json['original_title'] as String? ?? '',
  overview: json['overview'] as String? ?? '',
  posterPath: json['poster_path'] as String? ?? '',
  mediaType: json['media_type'] as String? ?? '',
  originalLanguage: json['original_language'] as String? ?? '',
  genreIds:
      (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  popularity: (json['popularity'] as num?)?.toDouble() ?? 0,
  releaseDate: _parseDate(json['release_date'] as String?),
  video: json['video'] as bool? ?? false,
  voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
  voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
  isFavourite: json['is_favourite'] as bool? ?? false,
);

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
  'adult': instance.adult,
  'backdrop_path': instance.backdropPath,
  'id': instance.id,
  'title': instance.title,
  'original_title': instance.originalTitle,
  'overview': instance.overview,
  'poster_path': instance.posterPath,
  'media_type': instance.mediaType,
  'original_language': instance.originalLanguage,
  'genre_ids': instance.genreIds,
  'popularity': instance.popularity,
  'release_date': _dateToJson(instance.releaseDate),
  'video': instance.video,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
  'is_favourite': instance.isFavourite,
};
