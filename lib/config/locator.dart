import 'package:get_it/get_it.dart';
import 'package:widgets_test/blocs/blocs.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ThemeCubit());
}
