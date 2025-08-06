// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 String get errorMessage; BlocStatus get trendingMoviesStatus; BlocStatus get nowPlayingStatus; BlocStatus get searchMoviesStatus; BlocStatus get favouriteMovieStatus; MovieListEntity? get trendingMoviesList; MovieListEntity? get nowPlayingList; MovieListEntity? get searchMoviesList; List<Result> get favouriteMovieList; SearchQueryRequestModel? get searchQueryRequestModel;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.trendingMoviesStatus, trendingMoviesStatus) || other.trendingMoviesStatus == trendingMoviesStatus)&&(identical(other.nowPlayingStatus, nowPlayingStatus) || other.nowPlayingStatus == nowPlayingStatus)&&(identical(other.searchMoviesStatus, searchMoviesStatus) || other.searchMoviesStatus == searchMoviesStatus)&&(identical(other.favouriteMovieStatus, favouriteMovieStatus) || other.favouriteMovieStatus == favouriteMovieStatus)&&(identical(other.trendingMoviesList, trendingMoviesList) || other.trendingMoviesList == trendingMoviesList)&&(identical(other.nowPlayingList, nowPlayingList) || other.nowPlayingList == nowPlayingList)&&(identical(other.searchMoviesList, searchMoviesList) || other.searchMoviesList == searchMoviesList)&&const DeepCollectionEquality().equals(other.favouriteMovieList, favouriteMovieList)&&(identical(other.searchQueryRequestModel, searchQueryRequestModel) || other.searchQueryRequestModel == searchQueryRequestModel));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,trendingMoviesStatus,nowPlayingStatus,searchMoviesStatus,favouriteMovieStatus,trendingMoviesList,nowPlayingList,searchMoviesList,const DeepCollectionEquality().hash(favouriteMovieList),searchQueryRequestModel);

@override
String toString() {
  return 'HomeState(errorMessage: $errorMessage, trendingMoviesStatus: $trendingMoviesStatus, nowPlayingStatus: $nowPlayingStatus, searchMoviesStatus: $searchMoviesStatus, favouriteMovieStatus: $favouriteMovieStatus, trendingMoviesList: $trendingMoviesList, nowPlayingList: $nowPlayingList, searchMoviesList: $searchMoviesList, favouriteMovieList: $favouriteMovieList, searchQueryRequestModel: $searchQueryRequestModel)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 String errorMessage, BlocStatus trendingMoviesStatus, BlocStatus nowPlayingStatus, BlocStatus searchMoviesStatus, BlocStatus favouriteMovieStatus, MovieListEntity? trendingMoviesList, MovieListEntity? nowPlayingList, MovieListEntity? searchMoviesList, List<Result> favouriteMovieList, SearchQueryRequestModel? searchQueryRequestModel
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errorMessage = null,Object? trendingMoviesStatus = null,Object? nowPlayingStatus = null,Object? searchMoviesStatus = null,Object? favouriteMovieStatus = null,Object? trendingMoviesList = freezed,Object? nowPlayingList = freezed,Object? searchMoviesList = freezed,Object? favouriteMovieList = null,Object? searchQueryRequestModel = freezed,}) {
  return _then(_self.copyWith(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,trendingMoviesStatus: null == trendingMoviesStatus ? _self.trendingMoviesStatus : trendingMoviesStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,nowPlayingStatus: null == nowPlayingStatus ? _self.nowPlayingStatus : nowPlayingStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,searchMoviesStatus: null == searchMoviesStatus ? _self.searchMoviesStatus : searchMoviesStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,favouriteMovieStatus: null == favouriteMovieStatus ? _self.favouriteMovieStatus : favouriteMovieStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,trendingMoviesList: freezed == trendingMoviesList ? _self.trendingMoviesList : trendingMoviesList // ignore: cast_nullable_to_non_nullable
as MovieListEntity?,nowPlayingList: freezed == nowPlayingList ? _self.nowPlayingList : nowPlayingList // ignore: cast_nullable_to_non_nullable
as MovieListEntity?,searchMoviesList: freezed == searchMoviesList ? _self.searchMoviesList : searchMoviesList // ignore: cast_nullable_to_non_nullable
as MovieListEntity?,favouriteMovieList: null == favouriteMovieList ? _self.favouriteMovieList : favouriteMovieList // ignore: cast_nullable_to_non_nullable
as List<Result>,searchQueryRequestModel: freezed == searchQueryRequestModel ? _self.searchQueryRequestModel : searchQueryRequestModel // ignore: cast_nullable_to_non_nullable
as SearchQueryRequestModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String errorMessage,  BlocStatus trendingMoviesStatus,  BlocStatus nowPlayingStatus,  BlocStatus searchMoviesStatus,  BlocStatus favouriteMovieStatus,  MovieListEntity? trendingMoviesList,  MovieListEntity? nowPlayingList,  MovieListEntity? searchMoviesList,  List<Result> favouriteMovieList,  SearchQueryRequestModel? searchQueryRequestModel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.errorMessage,_that.trendingMoviesStatus,_that.nowPlayingStatus,_that.searchMoviesStatus,_that.favouriteMovieStatus,_that.trendingMoviesList,_that.nowPlayingList,_that.searchMoviesList,_that.favouriteMovieList,_that.searchQueryRequestModel);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String errorMessage,  BlocStatus trendingMoviesStatus,  BlocStatus nowPlayingStatus,  BlocStatus searchMoviesStatus,  BlocStatus favouriteMovieStatus,  MovieListEntity? trendingMoviesList,  MovieListEntity? nowPlayingList,  MovieListEntity? searchMoviesList,  List<Result> favouriteMovieList,  SearchQueryRequestModel? searchQueryRequestModel)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.errorMessage,_that.trendingMoviesStatus,_that.nowPlayingStatus,_that.searchMoviesStatus,_that.favouriteMovieStatus,_that.trendingMoviesList,_that.nowPlayingList,_that.searchMoviesList,_that.favouriteMovieList,_that.searchQueryRequestModel);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String errorMessage,  BlocStatus trendingMoviesStatus,  BlocStatus nowPlayingStatus,  BlocStatus searchMoviesStatus,  BlocStatus favouriteMovieStatus,  MovieListEntity? trendingMoviesList,  MovieListEntity? nowPlayingList,  MovieListEntity? searchMoviesList,  List<Result> favouriteMovieList,  SearchQueryRequestModel? searchQueryRequestModel)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.errorMessage,_that.trendingMoviesStatus,_that.nowPlayingStatus,_that.searchMoviesStatus,_that.favouriteMovieStatus,_that.trendingMoviesList,_that.nowPlayingList,_that.searchMoviesList,_that.favouriteMovieList,_that.searchQueryRequestModel);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.errorMessage = '', this.trendingMoviesStatus = BlocStatus.initial, this.nowPlayingStatus = BlocStatus.initial, this.searchMoviesStatus = BlocStatus.initial, this.favouriteMovieStatus = BlocStatus.initial, this.trendingMoviesList, this.nowPlayingList, this.searchMoviesList, final  List<Result> favouriteMovieList = const [], this.searchQueryRequestModel}): _favouriteMovieList = favouriteMovieList;
  

@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  BlocStatus trendingMoviesStatus;
@override@JsonKey() final  BlocStatus nowPlayingStatus;
@override@JsonKey() final  BlocStatus searchMoviesStatus;
@override@JsonKey() final  BlocStatus favouriteMovieStatus;
@override final  MovieListEntity? trendingMoviesList;
@override final  MovieListEntity? nowPlayingList;
@override final  MovieListEntity? searchMoviesList;
 final  List<Result> _favouriteMovieList;
@override@JsonKey() List<Result> get favouriteMovieList {
  if (_favouriteMovieList is EqualUnmodifiableListView) return _favouriteMovieList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favouriteMovieList);
}

@override final  SearchQueryRequestModel? searchQueryRequestModel;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.trendingMoviesStatus, trendingMoviesStatus) || other.trendingMoviesStatus == trendingMoviesStatus)&&(identical(other.nowPlayingStatus, nowPlayingStatus) || other.nowPlayingStatus == nowPlayingStatus)&&(identical(other.searchMoviesStatus, searchMoviesStatus) || other.searchMoviesStatus == searchMoviesStatus)&&(identical(other.favouriteMovieStatus, favouriteMovieStatus) || other.favouriteMovieStatus == favouriteMovieStatus)&&(identical(other.trendingMoviesList, trendingMoviesList) || other.trendingMoviesList == trendingMoviesList)&&(identical(other.nowPlayingList, nowPlayingList) || other.nowPlayingList == nowPlayingList)&&(identical(other.searchMoviesList, searchMoviesList) || other.searchMoviesList == searchMoviesList)&&const DeepCollectionEquality().equals(other._favouriteMovieList, _favouriteMovieList)&&(identical(other.searchQueryRequestModel, searchQueryRequestModel) || other.searchQueryRequestModel == searchQueryRequestModel));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,trendingMoviesStatus,nowPlayingStatus,searchMoviesStatus,favouriteMovieStatus,trendingMoviesList,nowPlayingList,searchMoviesList,const DeepCollectionEquality().hash(_favouriteMovieList),searchQueryRequestModel);

@override
String toString() {
  return 'HomeState(errorMessage: $errorMessage, trendingMoviesStatus: $trendingMoviesStatus, nowPlayingStatus: $nowPlayingStatus, searchMoviesStatus: $searchMoviesStatus, favouriteMovieStatus: $favouriteMovieStatus, trendingMoviesList: $trendingMoviesList, nowPlayingList: $nowPlayingList, searchMoviesList: $searchMoviesList, favouriteMovieList: $favouriteMovieList, searchQueryRequestModel: $searchQueryRequestModel)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 String errorMessage, BlocStatus trendingMoviesStatus, BlocStatus nowPlayingStatus, BlocStatus searchMoviesStatus, BlocStatus favouriteMovieStatus, MovieListEntity? trendingMoviesList, MovieListEntity? nowPlayingList, MovieListEntity? searchMoviesList, List<Result> favouriteMovieList, SearchQueryRequestModel? searchQueryRequestModel
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,Object? trendingMoviesStatus = null,Object? nowPlayingStatus = null,Object? searchMoviesStatus = null,Object? favouriteMovieStatus = null,Object? trendingMoviesList = freezed,Object? nowPlayingList = freezed,Object? searchMoviesList = freezed,Object? favouriteMovieList = null,Object? searchQueryRequestModel = freezed,}) {
  return _then(_HomeState(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,trendingMoviesStatus: null == trendingMoviesStatus ? _self.trendingMoviesStatus : trendingMoviesStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,nowPlayingStatus: null == nowPlayingStatus ? _self.nowPlayingStatus : nowPlayingStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,searchMoviesStatus: null == searchMoviesStatus ? _self.searchMoviesStatus : searchMoviesStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,favouriteMovieStatus: null == favouriteMovieStatus ? _self.favouriteMovieStatus : favouriteMovieStatus // ignore: cast_nullable_to_non_nullable
as BlocStatus,trendingMoviesList: freezed == trendingMoviesList ? _self.trendingMoviesList : trendingMoviesList // ignore: cast_nullable_to_non_nullable
as MovieListEntity?,nowPlayingList: freezed == nowPlayingList ? _self.nowPlayingList : nowPlayingList // ignore: cast_nullable_to_non_nullable
as MovieListEntity?,searchMoviesList: freezed == searchMoviesList ? _self.searchMoviesList : searchMoviesList // ignore: cast_nullable_to_non_nullable
as MovieListEntity?,favouriteMovieList: null == favouriteMovieList ? _self._favouriteMovieList : favouriteMovieList // ignore: cast_nullable_to_non_nullable
as List<Result>,searchQueryRequestModel: freezed == searchQueryRequestModel ? _self.searchQueryRequestModel : searchQueryRequestModel // ignore: cast_nullable_to_non_nullable
as SearchQueryRequestModel?,
  ));
}


}

// dart format on
