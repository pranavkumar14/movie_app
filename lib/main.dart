import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/app/global/theme/app_theme.dart';
import 'package:movie_app/app/view/home/presentation/bloc/home_bloc.dart';

import 'app/core/route/app_route.dart';
import 'app/global/resources/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await configureDependencies();
  await Hive.initFlutter();
  await Hive.openBox<Map>('favorite_movies');
  await Hive.openBox('trending_movies');
  await Hive.openBox('now_playing_movies');
  await locator.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc(getTrendingMoviesUseCase: locator(), getNowPlayingUseCase: locator(), searchMoviesUseCase: locator())),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

