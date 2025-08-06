import 'package:get_it/get_it.dart';

import 'package:injectable/injectable.dart';
import 'package:movie_app/app/global/resources/injection_container.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
)
Future<void> configureDependencies() async => await locator.init();

