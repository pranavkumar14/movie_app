import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/view/home/data/datasource/local/movie_service.dart';
import 'package:movie_app/app/global/resources/use_case_request_model.dart';
import 'package:movie_app/app/view/home/data/model/movie_list_response_model.dart';
import 'package:movie_app/app/view/home/domain/entity/movie_list_entity.dart';
import 'package:movie_app/app/view/home/domain/usecase/get_now_playing_usecase.dart';
import 'package:movie_app/app/view/home/domain/usecase/get_trending_movies_usecase.dart';
import 'package:movie_app/app/view/home/domain/usecase/search_movies_usecase.dart';
import 'package:movie_app/app/view/home/presentation/bloc/home_event.dart';
import 'package:movie_app/app/view/home/presentation/bloc/home_state.dart';

import '../../../../global/resources/bloc_status_enum.dart';
import '../../../../global/utils/shared_preference_helper.dart';

@singleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTrendingMoviesUseCase getTrendingMoviesUseCase;
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final SearchMoviesUseCase searchMoviesUseCase;
  HomeBloc({
    required this.getTrendingMoviesUseCase,
    required this.getNowPlayingUseCase,
    required this.searchMoviesUseCase,
  }) : super(const HomeState()) {
    on<GetTrendingMoviesEvent>(getTrendingMovies);
    on<GetNowPlayingEvent>(getNowPlaying);
    on<SearchMoviesEvent>(searchMovies);
    on<RefreshFavouriteEvent>(refreshFavourite);
    on<FetchFavouriteEvent>(fetchFavouriteEvent);
  }

  Future<void> getTrendingMovies(GetTrendingMoviesEvent event, Emitter<HomeState> emit) async {
    // emit(state.copyWith(trendingMoviesStatus: BlocStatus.loading));
    final response = await getTrendingMoviesUseCase.call(
      params:  UseCaseRequestModel(),
    );
    response.fold(
          (l) => emit(
        state.copyWith(
          trendingMoviesStatus: BlocStatus.error,
          errorMessage: l.message,
        ),
      ),
          (r) {
        emit(state.copyWith(
          trendingMoviesStatus: BlocStatus.success,
          trendingMoviesList: r
        ),);
      },
    );
  }

  Future<void> getNowPlaying(GetNowPlayingEvent event, Emitter<HomeState> emit) async {
    // emit(state.copyWith(nowPlayingStatus: BlocStatus.loading));
    final response = await getNowPlayingUseCase.call(
      params:  UseCaseRequestModel(),
    );
    response.fold(
          (l) => emit(
        state.copyWith(
          nowPlayingStatus: BlocStatus.error,
          errorMessage: l.message,
        ),
      ),
          (r) {
        emit(state.copyWith(
          nowPlayingStatus: BlocStatus.success,
          nowPlayingList: r
        ),);
      },
    );
  }

  Future<void> searchMovies(SearchMoviesEvent event, Emitter<HomeState> emit) async {
    // emit(state.copyWith(searchMoviesStatus: BlocStatus.loading));
    final response = await searchMoviesUseCase.call(
      params: event.useCaseRequestModel,
    );
    response.fold(
          (l) => emit(
        state.copyWith(
          searchMoviesStatus: BlocStatus.error,
          errorMessage: l.message,
        ),
      ),
          (r) {
            SharedPreferenceHelper.saveString(SharedPreferenceHelper.keyLastSearch, event.useCaseRequestModel.body?.query ?? '');
            List<Result> old =
                state.searchMoviesList?.results ?? [];
            if (event.useCaseRequestModel.body!.pages == 1) {
              old = [];
            }
            emit(state.copyWith(
              searchMoviesStatus: BlocStatus.success,
              searchMoviesList: MovieListEntity(
                  totalPages: r.totalPages,
                  results: [...old, ...r.results],
                  page: r.page,
                  totalResults: r.totalResults
              ),
                searchQueryRequestModel: event.useCaseRequestModel.body
            ));
      },
    );
  }

  void refreshFavourite(RefreshFavouriteEvent event, Emitter<HomeState> emit){
    MovieService favoriteService = MovieService();
    if(state.trendingMoviesStatus.isSuccess){
      emit(state.copyWith(trendingMoviesStatus: BlocStatus.initial));
      var lst = state.trendingMoviesList!.results;
      for(var res in lst){
        if(res.id==event.id){
          res.isFavourite = favoriteService.isFavorite(event.id);
        }
      }
      emit(state.copyWith(trendingMoviesStatus: BlocStatus.success));
    }
    if(state.nowPlayingStatus.isSuccess){
      emit(state.copyWith(nowPlayingStatus: BlocStatus.initial));
      var lst = state.nowPlayingList!.results;
      for(var res in lst){
        if(res.id==event.id){
          res.isFavourite = favoriteService.isFavorite(event.id);
        }
      }
      emit(state.copyWith(nowPlayingStatus: BlocStatus.success));
    }
    if(state.searchMoviesStatus.isSuccess){
      emit(state.copyWith(searchMoviesStatus: BlocStatus.initial));
      var lst = state.searchMoviesList!.results;
      for(var res in lst){
        if(res.id==event.id){
          res.isFavourite = favoriteService.isFavorite(event.id);
        }
      }
      emit(state.copyWith(searchMoviesStatus: BlocStatus.success));
      emit(state.copyWith(
        favouriteMovieStatus: BlocStatus.success,
        favouriteMovieList: favoriteService.getFavorites(),
      ));
    }
  }

  void fetchFavouriteEvent(FetchFavouriteEvent event, Emitter<HomeState> emit) {
    MovieService favoriteService = MovieService();
    emit(state.copyWith(
      favouriteMovieStatus: BlocStatus.success,
      favouriteMovieList: favoriteService.getFavorites(),
    ));
  }


}