// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movie_app/app/core/network/api_client.dart' as _i620;
import 'package:movie_app/app/core/network/network_module.dart' as _i1058;
import 'package:movie_app/app/view/home/data/datasource/remote/home_datasource.dart'
    as _i451;
import 'package:movie_app/app/view/home/data/repo_impl/home_repo_impl.dart'
    as _i908;
import 'package:movie_app/app/view/home/domain/repository/home_repository.dart'
    as _i904;
import 'package:movie_app/app/view/home/domain/usecase/get_now_playing_usecase.dart'
    as _i881;
import 'package:movie_app/app/view/home/domain/usecase/get_trending_movies_usecase.dart'
    as _i239;
import 'package:movie_app/app/view/home/domain/usecase/search_movies_usecase.dart'
    as _i114;
import 'package:movie_app/app/view/home/presentation/bloc/home_bloc.dart'
    as _i52;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.lazySingletonAsync<_i361.Dio>(() => networkModule.dio());
    gh.lazySingletonAsync<_i620.ApiClient>(
      () async => networkModule.apiClient(await getAsync<_i361.Dio>()),
    );
    gh.lazySingletonAsync<_i451.HomeRemoteDataSource>(
      () async => _i451.HomeRemoteDataSourceImpl(
        apiClient: await getAsync<_i620.ApiClient>(),
      ),
    );
    gh.lazySingletonAsync<_i904.HomeRepository>(
      () async => _i908.HomeRepoImpl(
        homeRemoteDataSource: await getAsync<_i451.HomeRemoteDataSource>(),
      ),
    );
    gh.lazySingletonAsync<_i881.GetNowPlayingUseCase>(
      () async =>
          _i881.GetNowPlayingUseCase(await getAsync<_i904.HomeRepository>()),
    );
    gh.lazySingletonAsync<_i239.GetTrendingMoviesUseCase>(
      () async => _i239.GetTrendingMoviesUseCase(
        await getAsync<_i904.HomeRepository>(),
      ),
    );
    gh.lazySingletonAsync<_i114.SearchMoviesUseCase>(
      () async =>
          _i114.SearchMoviesUseCase(await getAsync<_i904.HomeRepository>()),
    );
    gh.singletonAsync<_i52.HomeBloc>(
      () async => _i52.HomeBloc(
        getTrendingMoviesUseCase:
            await getAsync<_i239.GetTrendingMoviesUseCase>(),
        getNowPlayingUseCase: await getAsync<_i881.GetNowPlayingUseCase>(),
        searchMoviesUseCase: await getAsync<_i114.SearchMoviesUseCase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i1058.NetworkModule {}
