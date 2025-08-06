// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:collection/collection.dart' as _i9;
import 'package:flutter/cupertino.dart' as _i10;
import 'package:flutter/material.dart' as _i7;
import 'package:movie_app/app/view/home/data/model/movie_list_response_model.dart'
    as _i8;
import 'package:movie_app/app/view/home/presentation/pages/home_page.dart'
    as _i1;
import 'package:movie_app/app/view/home/presentation/pages/movie_details_page.dart'
    as _i2;
import 'package:movie_app/app/view/home/presentation/pages/search_result_page.dart'
    as _i5;
import 'package:movie_app/app/view/home/presentation/widgets/movie_list_widget.dart'
    as _i3;
import 'package:movie_app/app/view/screen_wrapper.dart' as _i4;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.MovieDetailPage]
class MovieDetailRoute extends _i6.PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    _i7.Key? key,
    required _i8.Result movie,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         MovieDetailRoute.name,
         args: MovieDetailRouteArgs(key: key, movie: movie),
         initialChildren: children,
       );

  static const String name = 'MovieDetailRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailRouteArgs>();
      return _i2.MovieDetailPage(key: args.key, movie: args.movie);
    },
  );
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({this.key, required this.movie});

  final _i7.Key? key;

  final _i8.Result movie;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movie: $movie}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovieDetailRouteArgs) return false;
    return key == other.key && movie == other.movie;
  }

  @override
  int get hashCode => key.hashCode ^ movie.hashCode;
}

/// generated route for
/// [_i3.MovieListWidget]
class MovieListWidget extends _i6.PageRouteInfo<MovieListWidgetArgs> {
  MovieListWidget({
    _i7.Key? key,
    required List<_i8.Result> movies,
    required String title,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         MovieListWidget.name,
         args: MovieListWidgetArgs(key: key, movies: movies, title: title),
         initialChildren: children,
       );

  static const String name = 'MovieListWidget';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieListWidgetArgs>();
      return _i3.MovieListWidget(
        key: args.key,
        movies: args.movies,
        title: args.title,
      );
    },
  );
}

class MovieListWidgetArgs {
  const MovieListWidgetArgs({
    this.key,
    required this.movies,
    required this.title,
  });

  final _i7.Key? key;

  final List<_i8.Result> movies;

  final String title;

  @override
  String toString() {
    return 'MovieListWidgetArgs{key: $key, movies: $movies, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovieListWidgetArgs) return false;
    return key == other.key &&
        const _i9.ListEquality().equals(movies, other.movies) &&
        title == other.title;
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i9.ListEquality().hash(movies) ^ title.hashCode;
}

/// generated route for
/// [_i4.ScreenWrapperPage]
class RouteWrapperRoute extends _i6.PageRouteInfo<void> {
  const RouteWrapperRoute({List<_i6.PageRouteInfo>? children})
    : super(RouteWrapperRoute.name, initialChildren: children);

  static const String name = 'RouteWrapperRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.WrappedRoute(child: const _i4.ScreenWrapperPage());
    },
  );
}

/// generated route for
/// [_i5.SearchResultPage]
class SearchResultRoute extends _i6.PageRouteInfo<SearchResultRouteArgs> {
  SearchResultRoute({
    _i10.Key? key,
    String query = '',
    List<_i6.PageRouteInfo>? children,
  }) : super(
         SearchResultRoute.name,
         args: SearchResultRouteArgs(key: key, query: query),
         rawQueryParams: {'query': query},
         initialChildren: children,
       );

  static const String name = 'SearchResultRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<SearchResultRouteArgs>(
        orElse:
            () => SearchResultRouteArgs(
              query: queryParams.getString('query', ''),
            ),
      );
      return _i5.SearchResultPage(key: args.key, query: args.query);
    },
  );
}

class SearchResultRouteArgs {
  const SearchResultRouteArgs({this.key, this.query = ''});

  final _i10.Key? key;

  final String query;

  @override
  String toString() {
    return 'SearchResultRouteArgs{key: $key, query: $query}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SearchResultRouteArgs) return false;
    return key == other.key && query == other.query;
  }

  @override
  int get hashCode => key.hashCode ^ query.hashCode;
}
